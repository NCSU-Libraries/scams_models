module ScamsModels::Concerns::Models::ResourceDate
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
  end

end