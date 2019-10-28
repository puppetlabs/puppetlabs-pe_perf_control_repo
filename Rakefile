# frozen_string_literal: true

require "rubocop/rake_task"
require "puppet-lint/tasks/puppet-lint"
require "r10k/action/puppetfile/install"
require "rspec/core/rake_task"

RuboCop::RakeTask.new
PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = ["vendor/**/*", "modules/**/*"]
  # Disabled checks should be removed after the puppet code has been updated.
  config.disable_checks = %w[autoloader_layout
                             documentation
                             140chars
                             double_quoted_strings
                             arrow_alignment
                             only_variable_string
                             trailing_whitespace
                             arrow_on_right_operand_line
                             case_without_default]
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
end
