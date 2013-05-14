module ScamsModels::Concerns::Models::Bitstream
  extend ActiveSupport::Concern

  included do
    belongs_to :bundle
    delegate :resource, :to => :bundle
    attr_accessible :extension, :filename, :intention, :type
    self.inheritance_column = :type_inheritance
  end


  def base_av_url
    'http://siskel.lib.ncsu.edu/SCRC/'
  end

  def url
    if audio? or video? or image? or vtt?
      File.join(base_av_url, bundle.filename, filename)
    end
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