module ScamsModels::Concerns::Models::EacDate
  extend ActiveSupport::Concern

  included do
    belongs_to :eac
  end

end