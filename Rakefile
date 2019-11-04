# frozen_string_literal: true

require "rubocop/rake_task"
require "puppet-lint/tasks/puppet-lint"
require "r10k/action/puppetfile/install"
require "rspec/core/rake_task"

RuboCop::RakeTask.new
PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = ["vendor/**/*", "modules/**/*"]
  # User ssh keys exceed 140 characters and should not be split to accomodate a check.
  config.disable_checks = %w[140chars]
end

namespace :test do
  desc "Install modules"
  task :install_modules do
    R10K::Action::Puppetfile::Install.new({ root: File.dirname(__FILE__) }, [], {}).call
  end

  desc "Spec tests"
  task spec: [:install_modules] do
    RSpec::Core::RakeTask.new(:spec)
    Rake::Task["spec"].execute
  end
  desc "Run all tests"
  task all: [:rubocop, :lint, "test:spec"]
end
