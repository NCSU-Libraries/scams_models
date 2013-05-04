module ScamsModels::Concerns::Models::DigitalCreator
  extend ActiveSupport::Concern

  included do
    has_many :resources
    has_many :stub_generators
  end

end