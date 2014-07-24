current_dir = File.dirname(__FILE__)
username    = ENV['CHEF_USER'] ? ENV['CHEF_USER']: ENV['USER']
log_level                :info
log_location             STDOUT
node_name                username
client_key               "#{current_dir}/#{username}.pem"
validation_client_name   'chef-validator'
validation_key           "#{current_dir}/validation.pem"
chef_server_url          'http://33.33.33.1:8889'
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/cookbooks"]


#print("You are on branch #{branch} and your chef server is: #{url}\n")

if !File.exist?("#{current_dir}/#{username}.pem")
  client_key    "#{ENV['HOME']}/.chef/#{username}.pem"
end
