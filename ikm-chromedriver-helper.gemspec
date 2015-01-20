# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "chromedriver/helper/version"

Gem::Specification.new do |s|
  s.name        = "ikm-chromedriver-helper"
  s.version     = Chromedriver::Helper::VERSION
  s.authors     = ["Mike Dalessio"]
  s.email       = ["mike@csa.net"]
  s.homepage    = "https://github.com/a2ikm/chromedriver-helper"
  s.summary     = "Easy installation and use of chromedriver, the Chromium project's selenium webdriver adapter. Forked from chromedriver-helper."
  s.description = "Easy installation and use of chromedriver, the Chromium project's selenium webdriver adapter. Forked from chromedriver-helper."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rake"
  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "version_sorter"
  s.add_runtime_dependency "download"
  s.add_runtime_dependency "rubyzip"
end
