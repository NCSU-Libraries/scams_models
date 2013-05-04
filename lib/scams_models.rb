# ScamsModels

require 'scams_models/engine'


module ScamsModels
  module Concerns
    module Models

    end
  end
end

Dir[File.dirname(__FILE__) + "/concerns/models/*.rb"].each {|file| require file }
