default[:bind9][:masterrole]='ns-master'
default[:bind9][:mgn_int]='eth1'
default[:bindview] = 'noview'

default[:domain] = "testbind.com"
default[:nameserver] = ["ns001.testbind.com"]
default[:mailserver] = "mail.testbind.com"
default[:defaultview] = "noview"
default[:zone] = "firstzone.com"
default[:bind9][:acl]= {
  "interal" => ["10/8","192.168/16","33.33.33/24"],
  "external" => ["any"]
}

default[:bind9][:options]['allow-query'] = ['interal']
