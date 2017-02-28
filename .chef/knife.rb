# See https://docs.chef.io/azure_portal.html#azure-marketplace/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "jogule"
client_key               "#{current_dir}/jogule.pem"
validation_client_name   "jglcorp-validator"
validation_key           "#{current_dir}/jglcorp-validator.pem"
chef_server_url          "https://jglwapchef.eastus2.cloudapp.azure.com/organizations/jglcorp"
cookbook_path            ["#{current_dir}/../cookbooks"]
