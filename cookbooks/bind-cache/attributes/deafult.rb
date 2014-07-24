
normal[:bind9][:options][:recursion]='yes'
normal[:bind9][:options]['allow-recursion'] = ['transted']
default[:bind9][:acl]= {
  "transted" => ["33.33.33/24","192.168/16","10/8"]
}
