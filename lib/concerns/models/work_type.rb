module ScamsModels::Concerns::Models::WorkType
  extend ActiveSupport::Concern

  included do
    has_many :works
  end

end