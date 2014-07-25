default[:domain] = "testbind.com"
default[:nameserver] = ["ns001.testbind.com"]
default[:mailserver] = "mail.testbind.com"
default[:defaultview] = "noview"
default[:zone] = "firstzone.com"
default[:bind9][:acl]= {
  "internal" => ["33.33.33/24"],
  "external" => ["any"]
}
