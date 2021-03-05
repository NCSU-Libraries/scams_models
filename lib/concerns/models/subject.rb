module ScamsModels::Concerns::Models::Subject
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :resources
    has_many :work_subjects
    has_many :works, :through => :work_subjects
    default_scope -> { order('subject ASC') }
  end

end
