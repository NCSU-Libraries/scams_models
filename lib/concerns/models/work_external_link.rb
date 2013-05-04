module ScamsModels::Concerns::Models::WorkExternalLink
  extend ActiveSupport::Concern

  included do
    belongs_to :work
    belongs_to :external_link
  end

end