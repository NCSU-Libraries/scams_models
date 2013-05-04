module ScamsModels::Concerns::Models::Work
  extend ActiveSupport::Concern

  included do
    has_many :work_geographic_locations
    has_many :geographic_locations, :through => :work_geographic_locations #, :foreign_key => :geographic_location_id
    
    has_many :work_subjects
    has_many :subjects, :through => :work_subjects
    
    has_many :expressions
    has_many :resources, :through => :expressions
    
    has_many :work_external_links
    has_many :external_links, :through => :work_external_links
    
    has_many :work_notes
    belongs_to :work_type
    
    has_many :work_creators
  end

end