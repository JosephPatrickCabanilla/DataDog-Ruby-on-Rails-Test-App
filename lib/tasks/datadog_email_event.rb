require 'rubygems'
require 'dogapi'
require 'mail'
require 'json'
require 'yaml'


keys = YAML.load(File.read("datadog_config.yaml"))

email = YAML.load(File.read("datadog_email_info.yaml"))

event_id = '2166338758139034087'


dog = Dogapi::Client.new(keys['api_key'], keys['app_key'])

response = dog.get_event(event_id)

options = { 
  :address => email['address'],
  :port => email['port'],
  :domain => email['domain'],
  :user_name => email['user_name'],
  :password => email['password'],
  :authentication => email['authentication'],
  :enable_starttls_auto => true  }


Mail.defaults do
  delivery_method :smtp, options
end


Mail.deliver do
  to email['user_name']
  from 'not_a_real_email@datadoghq.com'
  subject 'Event from DataDog: '+event_id
  body response
end






