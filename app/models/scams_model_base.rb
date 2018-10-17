class ScamsModelBase < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "scams_#{Rails.env}"
end
