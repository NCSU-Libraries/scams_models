module ScamsModels::Concerns::Models::Bundle
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
    has_many :bitstreams, inverse_of: :bundle
    # attr_accessible :description, :filename, :title, :type
    self.inheritance_column = :type_inheritance
  end

  def avpd_base_url
    "https://avpd.lib.ncsu.edu"
  end

  def avpd_api_url
    File.join avpd_base_url, "api/av/#{filename}"
  end

  def avpd_response
    if @avpd_response
      @avpd_response
    else
      client = HTTPClient.new
      response = client.get(avpd_api_url)
      if response.code > 399
        @avpd_response = {}
      else
        json = response.body
        @avpd_response = JSON.parse(json)
      end
    end
  end

  def av_extension(extension)
    avpd_response.present? && avpd_response['avmaterial'].present? ? avpd_response['avmaterial'].select{|material| material['format'].include?(extension)} : []
  end

  def iso8601tosecs(raw_duration)
    match = raw_duration.match(/PT(?:([0-9]*)H)*(?:([0-9]*)M)*(?:([0-9.]*)S)*/)
    hours   = match[1].to_i
    minutes = match[2].to_i
    seconds = match[3].to_f
    seconds + (60 * minutes) + (60 * 60 * hours)
  end

  def iso8601duration
    avpd_response['duration'] ? avpd_response['duration'] : nil
  end

  def avpd_duration
    avpd_response['duration'] ? iso8601tosecs(avpd_response['duration']) : "0:00"
  end

  def avpd_captions_response
    avpd_response['captions']
  end
  
  def captions?
    avpd_captions_response.present?
  end

  def avpd_poster
    avpd_response['poster'] ? avpd_response['poster']['id'] : nil
  end

  def audio?
    resource.audio?
  end

  def video?
    resource.video?
  end

  def mp3
    av_extension('mp3').first
  end

  def ogg
    av_extension('ogg').first
  end

  def mp4
    av_extension('mp4').first
  end

  def webm
    av_extension('webm').first
  end

  def png
    avpd_response['poster']
  end

  def vtt
    avpd_captions_response ? avpd_captions_response['id'] : nil
  end

  def webvtt
    begin
      uri = URI.parse(vtt)
      response = Net::HTTP.get_response(uri)
      if response.code == "200"
        Webvtt::File.new(vtt)
      else
        false
      end
    rescue => e
    end
  end

end