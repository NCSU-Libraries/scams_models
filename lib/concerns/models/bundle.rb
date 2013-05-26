module ScamsModels::Concerns::Models::Bundle
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
    has_many :bitstreams, inverse_of: :bundle
    attr_accessible :description, :filename, :title, :type
    self.inheritance_column = :type_inheritance
  end


  def av_extension(extension)
    bitstreams.where(:extension => extension)
  end

  def audio?
    resource.audio?
  end

  def video?
    resource.video?
  end

  def mp3
    av_extension(:mp3).first
  end

  def ogg
    av_extension(:ogg).first
  end

  def mp4
    av_extension(:mp4).first
  end

  def webm
    av_extension(:webm).first
  end

  def png
    av_extension(:png).first
  end

  def vtt
    av_extension(:vtt).first
  end

end