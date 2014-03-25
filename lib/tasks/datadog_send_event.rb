# script for sending an event to datadog

require 'rubygems'
require 'dogapi'
require 'yaml'

keys = YAML.load(File.read("datadog_config.yaml"))

dog = Dogapi::Client.new(keys['api_key'])

response = dog.emit_event(Dogapi::Event.new('Test message!', :msg_title => 'Test Title!'))

puts response
  

