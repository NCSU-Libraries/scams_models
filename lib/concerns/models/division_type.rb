module ScamsModels::Concerns::Models::DivisionType
  extend ActiveSupport::Concern

  included do
    has_many :divisions
  end

end