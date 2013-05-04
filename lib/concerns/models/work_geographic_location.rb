module ScamsModels::Concerns::Models::WorkGeographicLocation
  extend ActiveSupport::Concern

  included do
    belongs_to :work
    belongs_to :geographic_location
  end

end