module ScamsModels::Concerns::Models::WorkCreator
  extend ActiveSupport::Concern

  included do
    belongs_to :work
    belongs_to :eac
    belongs_to :name_role
  end

end