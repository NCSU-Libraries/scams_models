module ScamsModels::Concerns::Models::Region
  extend ActiveSupport::Concern

  included do
    has_many :geographic_locations
  end

end