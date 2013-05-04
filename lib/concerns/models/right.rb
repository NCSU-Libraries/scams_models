module ScamsModels::Concerns::Models::Right
  extend ActiveSupport::Concern

  included do
    has_many :resources
    has_many :stub_generators
  end

end