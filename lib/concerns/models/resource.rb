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

    has_many :resource_dates, :order => 'date_field ASC', :dependent => :destroy

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

  def match_simple_asset_type?(asset_type)
    asset_types.first && asset_types.first.asset_type == asset_type
  end

  def audio?
    match_simple_asset_type?('Audio')
  end

  def video?
    match_simple_asset_type?('Video')
  end

end