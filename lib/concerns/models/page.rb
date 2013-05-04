module ScamsModels::Concerns::Models::Page
  extend ActiveSupport::Concern

  included do
    belongs_to :division
  end

end