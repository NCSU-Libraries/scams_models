module ScamsModels::Concerns::Models::TitleOther
  extend ActiveSupport::Concern

  included do
    belongs_to :resource
    belongs_to :title_source
    # FIXME belongs_to :titleothersource, :foreign_key => 'titleOtherSource'
  end

end