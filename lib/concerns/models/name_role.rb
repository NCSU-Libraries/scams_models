module ScamsModels::Concerns::Models::NameRole
  extend ActiveSupport::Concern

  included do
    has_many :creators
    has_many :contributors
    has_many :work_creators
  end

end