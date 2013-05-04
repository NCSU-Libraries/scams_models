module ScamsModels::Concerns::Models::ResourceTopic
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
    belongs_to :topic
  end

end