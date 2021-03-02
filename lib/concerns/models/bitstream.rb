module ScamsModels::Concerns::Models::Bitstream
  extend ActiveSupport::Concern

  included do
    belongs_to :bundle, inverse_of: :bitstreams
    delegate :resource, :to => :bundle
    # attr_accessible :extension, :filename, :intention, :type
    self.inheritance_column = :type_inheritance
  end


  def exttotype
    if audio? or video?
      'avmaterial'
    elsif image?
      'poster'
    elsif vtt?
      'captions'
    elsif pdf?
      'transcript'
    end
  end

  def avpd_item
    item = bundle.avpd_response[exttotype]
    item = item.class == Array ? item.select{|elem| elem['id'].include? extension}.first : item
    item
  end

  def url
    if audio? or video? or image? or vtt? or pdf?
        avpd_item ? avpd_item['id'] : nil
    end
  end

  def duration
    if audio? or video?
      bundle.avpd_duration
    end
  end

  def width
    avpd_item ? avpd_item['width'] : nil
  end

  def height
    avpd_item ? avpd_item['height'] : nil
  end

  def pdf?
    %w[pdf].include? extension
  end

  def audio?
    %w[mp3 ogg].include? extension
  end

  def video?
    %w[mp4 webm].include? extension
  end

  def image?
    %w[png].include? extension
  end

  def vtt?
    %w[vtt].include? extension
  end

  def webvtt
    begin
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      if response.code == "200"
        Webvtt::File.new(response.body)
      else
        false
      end
    rescue => e
    end
  end

  def duration_iso8601
    hours  =  duration / 1.hour
    minutes = (duration - hours.hours) / 1.minute
    seconds = duration - hours.hours - minutes.minutes
    output = 'T'
    output << "#{hours}H" if hours > 0
    output << "#{minutes}M" if minutes > 0
    output << "#{seconds}S" if seconds > 0
    output
  end

  def duration_pretty
    if !duration.blank?
      total_minutes = duration / 1.minutes
      seconds_in_last_minute = duration - total_minutes.minutes.seconds
      %Q|#{total_minutes}:#{"%02d" % seconds_in_last_minute}|
    end
  end

end
