module ScamsModels::Concerns::Models::Creator
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
    belongs_to :eac
    belongs_to :name_role
  end

end