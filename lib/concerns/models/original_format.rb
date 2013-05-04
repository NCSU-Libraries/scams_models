module ScamsModels::Concerns::Models::OriginalFormat
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :resources
  end

end