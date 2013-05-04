module ScamsModels::Concerns::Models::Crop
  extend ActiveSupport::Concern

  included do
    has_many :jp2s
  end

end