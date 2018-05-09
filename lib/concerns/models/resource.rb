module ScamsModels::Concerns::Models::Resource
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :asset_types
    belongs_to :classification
    has_many :creators, :dependent => :destroy
    has_many :contributors, :dependent => :destroy

    belongs_to :digital_creator
    has_many :digital_formats
    has_many :divisions, :dependent => :destroy
    has_many :pages, :through => :divisions

    has_and_belongs_to_many :eacs

    has_and_belongs_to_many :genres
    has_and_belongs_to_many :geographic_locations
    has_and_belongs_to_many :is_part_ofs
    has_and_belongs_to_many :languages
    has_and_belongs_to_many :original_formats

    has_many :publications, :dependent => :destroy
    belongs_to :repository
    belongs_to :right

    has_and_belongs_to_many :subjects

    has_many :resource_dates, -> { order('date_field ASC') }, :dependent => :destroy

    has_one :series_title, :dependent => :destroy
    has_many :title_others, :dependent => :destroy
    belongs_to :title_source

    has_many :jp2s, :dependent => :destroy

    has_many :expressions, :dependent => :destroy
    has_many :works, :through => :expressions

    has_many :resource_topics
    has_many :topics, :through => :resource_topics

    has_many :bundles
    has_many :bitstreams, :through => :bundles
  end

  def filename
    fileName
  end


  # FIXME: reconcile the two different ways of getting asset types for resources
  def match_simple_asset_type?(asset_type)
    asset_types.first && asset_types.first.asset_type == asset_type
  end

  def audio?
    match_simple_asset_type?('Audio')
  end

  def video?
    match_simple_asset_type?('Video')
  end

  def folder?
    match_simple_asset_type?('Folder')
  end

  def simple_asset_types
    asset_types.map do |at|
      at.asset_type
    end
  end

  def still_image?
    simple_asset_types.include? 'Still image'
  end

  def drawing?
    simple_asset_types.include? 'Drawing'
  end

  def pdf_url
    if pdf
      collection = fileName.split('-').first
      "http://d.lib.ncsu.edu/pdfs/#{collection}/#{fileName}.pdf"
    end
  end

  def basename
    if fileName.include?('_')
      basename_parts = fileName.split('_')
      last_part = basename_parts.pop
      if /\d{4}$/.match(last_part)
        basename_parts.join('_')
      else
        fileName
      end
    else
      fileName
    end
  end


end