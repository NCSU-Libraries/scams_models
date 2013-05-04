module ScamsModels::Concerns::Models::SeriesTitle
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
  end

end