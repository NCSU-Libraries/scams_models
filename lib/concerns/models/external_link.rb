module ScamsModels::Concerns::Models::ExternalLink
  extend ActiveSupport::Concern

  included do
    has_many :work_external_links
    has_many :works, :through => :work_external_links
  end

end