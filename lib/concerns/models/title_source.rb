module ScamsModels::Concerns::Models::TitleSource
  extend ActiveSupport::Concern

  included do
    has_many :title_others
    has_many :resources
  end

end