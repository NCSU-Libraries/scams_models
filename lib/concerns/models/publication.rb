module ScamsModels::Concerns::Models::Publication
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
  end

end