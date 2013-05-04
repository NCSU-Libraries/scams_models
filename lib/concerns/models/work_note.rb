module ScamsModels::Concerns::Models::WorkNote
  extend ActiveSupport::Concern

  included do
    belongs_to :work
    belongs_to :note_type
  end

end