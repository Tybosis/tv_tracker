require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'rake/testtask'
require './lib/tasks/series_updater_tasks'

Rake::TestTask.new('test:features') do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = '**/*_test.rb'
end
