module ScamsModels::Concerns::Models::Repository
  extend ActiveSupport::Concern

  included do
    has_many :resources
    has_many :stub_generators
  end

end