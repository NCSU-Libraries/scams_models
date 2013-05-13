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

end