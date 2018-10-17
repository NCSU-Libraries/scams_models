module ScamsModels::Concerns::Models::Genre
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :resources
    has_many :stub_generators
    default_scope -> { order('genre ASC') }
  end

end
