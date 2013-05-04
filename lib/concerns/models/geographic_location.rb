module ScamsModels::Concerns::Models::GeographicLocation
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :resources
    has_many :stub_generators
    belongs_to :region
    
    has_many :work_geographic_locations
    has_many :works, :through => :work_geographic_locations
  end

end