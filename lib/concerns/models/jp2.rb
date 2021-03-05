module ScamsModels::Concerns::Models::Jp2
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
    belongs_to :crop
    default_scope -> { order("filename ASC") }
  end

  # URL for the largest level image available
  def url
    Djatoka.resolver.region(filename).scale(1800).url
  end

end