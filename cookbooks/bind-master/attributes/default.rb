
default[:bind9][:keys]['noview'][:algorithm] = "hmac-md5"
default[:bind9][:keys]['noview'][:secret] = 'RIt1OLtusHxxVZpRII8CSA=='
default[:bind9][:slaverole] = "ns-slave"
default[:bind9][:mgn_int] = 'eth1'

default[:domain] = "testbind.com"
default[:nameserver] = ["ns001.testbind.com"]
default[:mailserver] = "mail.testbind.com"
default[:defaultview] = "noview"
default[:zone] = "firstzone.com"
default[:bind9][:acl]= {
  "transfer" => ["33.33.33/24"]
}
default[:bind9][:options]['allow-query'] = ['transfer']
