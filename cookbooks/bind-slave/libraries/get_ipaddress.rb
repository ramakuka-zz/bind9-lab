def get_ipaddress p={}
  _node = node
  _node = p[:node] if p[:node]

  _interface_name = 'eth0'
  _interface_name = p[:interface] if p[:interface]

  if _node.has_key?('network') && _node['network'] &&
    _node['network'].has_key?('interfaces') && _node['network']['interfaces'] &&
    _node['network']['interfaces'].has_key?(_interface_name) && _node['network']['interfaces'][_interface_name] &&
    _node['network']['interfaces'][_interface_name].has_key?("addresses") && _node['network']['interfaces'][_interface_name]["addresses"]

    _ip = _node['network']['interfaces'][_interface_name]["addresses"].find {|k,v| v['family'] == 'inet' }
    # let's validate if it looks like IP address
    if _ip && _ip[0] && _ip[0] =~ /^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/
      _ip[0]
    else
      false
    end
  else
    false
  end
end
