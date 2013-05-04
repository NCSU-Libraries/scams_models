module ScamsModels::Concerns::Models::Topic
  extend ActiveSupport::Concern

  included do
    has_many :resource_topics
    has_many :resources, :through => :resource_topics
  end

end