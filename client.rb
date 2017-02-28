current_dir = File.dirname(__FILE__)

log_level        :info
log_location     STDOUT
chef_server_url  'https://jglwapchef.eastus2.cloudapp.azure.com/organizations/jglcorp'
validation_client_name 'jglcorp-validator'
validation_key '#{current_dir}/jglcorp-validator.pem'
client_key '#{current_dir}/jogule.pem'