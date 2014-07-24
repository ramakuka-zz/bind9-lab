bind9 Lab
=========
This Lab contains some use cases that can help demonstrate how to use the bind9 cookbook.
I used it for my development and I figured it can be a nice help for who ever want to try the cookbook, so please clone it fork it and share your findings so we can keep improve it.

How to use this lab
===================

prerequisites
-----------
In order to use this lab you will need vagrant and chef-zero .
Vagrant can be downloaded from here : https://www.vagrantup.com/downloads.html  
Chef zero can be installed by running the command ``` gem install chef-zero ```

Chef-zero
---------
This Lab will create few VMs based on the specified scenario listed on the Vagrantfile. the Vms will use the ip address from a range of 33.33.33.X and will try to register to a chef server on address 33.33.33.1.  

Simply run ``` chef-zero -H 33.33.33.1 &``` and you'll have a running chef instance.  
Run the script upload.sh to upload all the cookbooks and roles to the chef server. You will see some errors in the first time you run the script so make sure you run the script twice until I'll have some time to use the chef-zero plugin for vagrant that will fix all the issues.

Running the LAB
---------------
Simply edit the Vagrant file with the desired architecture and run ``` vagrant up ```. for some scenarios chef client need to be run more then one time as it rallies on searches and attributes.so please run ``` vagrant provision ``` after the first implementation.
It will create the VMS and install all the needed components for bind to work based on the chosen scenario.

TODO
=====
* Add support to chef-zero plugin in vagrant to avoid running the upload script twice
* Have vagrant automatically run provision after the first run
* Use it and come up with more scenarios
