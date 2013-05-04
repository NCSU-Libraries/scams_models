module ScamsModels::Concerns::Models::Eac
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :resources
    has_many :eac_dates
    has_many :contributors
    has_many :creators
    has_many :resource_creators, :through => :creators, :foreign_key => :resource_id, :source => :resource
    has_many :resource_contributors, :through => :contributors, :foreign_key => :resource_id, :source => :resource
    
    has_many :stub_generators
    has_many :work_creators    
    has_many :works, :through => :work_creators
  end

  def schemaorg_type
    if subjectType == 'personal'
      'http://schema.org/Person'
    else
      'http://schema.org/Organization'
    end
  end

  def person?
    subjectType == 'personal'
  end

end