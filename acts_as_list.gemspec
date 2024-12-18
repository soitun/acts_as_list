# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "acts_as_list/version"

Gem::Specification.new do |s|
  # Description Meta...
  s.name                  = "acts_as_list"
  s.version               = ActiveRecord::Acts::List::VERSION
  s.platform              = Gem::Platform::RUBY
  s.authors               = ["Swanand Pagnis", "Brendon Muir"]
  s.email                 = %w(swanand.pagnis@gmail.com brendon@spikeatschool.co.nz)
  s.homepage              = "https://github.com/brendon/acts_as_list"
  s.summary               = "A gem adding sorting, reordering capabilities to an active_record model, allowing it to act as a list"
  s.description           = 'This "acts_as" extension provides the capabilities for sorting and reordering a number of objects in a list. The class that has this specified needs to have a "position" column defined as an integer on the mapped database table.'
  s.license               = "MIT"
  s.required_ruby_version = ">= 2.5"

  if s.respond_to?(:metadata)
    s.metadata['changelog_uri']   = 'https://github.com/brendon/acts_as_list/blob/master/CHANGELOG.md'
    s.metadata['source_code_uri'] = 'https://github.com/brendon/acts_as_list'
    s.metadata['bug_tracker_uri'] = 'https://github.com/brendon/acts_as_list/issues'
    s.metadata['funding_uri']     = 'https://github.com/sponsors/brendon'
    s.metadata['rubygems_mfa_required'] = 'true'
  end

  # Load Paths...
  gemspec = File.basename(__FILE__)
  s.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  s.executables   = `git ls-files -- bin/*`.split("\n").map {|f| File.basename(f)}
  s.require_paths = ["lib"]

  # Dependencies (installed via "bundle install")
  s.add_dependency "activerecord", ">= 6.1"
  s.add_dependency "activesupport", ">= 6.1"
  s.add_development_dependency "minitest-hooks", "~> 1.5.1"
  s.add_development_dependency "mocha", "~> 2.1.0"
  s.add_development_dependency "timecop", "~> 0.9.8"
  s.add_development_dependency "mysql2", "~> 0.5.6"
  s.add_development_dependency "pg", "~> 1.5.5"
  s.add_development_dependency "sqlite3", "~> 1.7.2"
end
