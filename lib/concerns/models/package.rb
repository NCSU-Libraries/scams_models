module ScamsModels::Concerns::Models::Package
  extend ActiveSupport::Concern

  included do
    belongs_to :metadata_creator
    belongs_to :classification
  end

end