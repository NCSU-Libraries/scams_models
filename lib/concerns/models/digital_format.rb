module ScamsModels::Concerns::Models::DigitalFormat
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
  end

end