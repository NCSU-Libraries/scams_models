# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "scams_models/version"

Gem::Specification.new do |s|
  s.name        = "scams_models"
  s.version     = ScamsModels::VERSION
  s.authors     = ["Jason Ronallo"]
  s.email       = ["jnronall@ncsu.edu"]
  s.homepage    = ""
  s.summary     = %q{SCAMS models for reuse in other applications}
  s.description = %q{SCAMS models for reuse in other applications}

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 5.1.0"
  s.add_dependency 'webvtt'
end
