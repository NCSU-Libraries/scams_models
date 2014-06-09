module ScamsModels::Concerns::Models::Division
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
    belongs_to :division_type
    has_many :pages, :dependent => :destroy
    default_scope { order('divisionSequenceNumber ASC') }
  end

end