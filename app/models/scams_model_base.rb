class ScamsModelBase < ActiveRecord::Base
  self.abstract_class = true

  connects_to database: { writing: :scams, reading: :scams }
end
