module ScamsModels::Concerns::Models::Expression
  extend ActiveSupport::Concern

  included do
    belongs_to :work
    belongs_to :resource
  end

end