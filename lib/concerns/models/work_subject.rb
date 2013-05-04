module ScamsModels::Concerns::Models::WorkSubject
  extend ActiveSupport::Concern

  included do
    belongs_to :work
    belongs_to :subject
  end

end