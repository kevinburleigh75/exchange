OpenStax Exchange
=================

More info coming soon.

Vagrant
=======

OpenStax Exchange uses chef to configure its production environment, and this
environment can also be replicated using Vagrant.

1. Install Vagrant
    * Get an installer from http://downloads.vagrantup.com/, don't use the old ````gem install vagrant```` approach.  If you had previously installed the gem version uninstall it first.
1. ````$ vagrant plugin install vagrant-berkshelf````
3. ````$ vagrant up````

As you'll see in our ````Berksfile```` file, our Vagrant instance uses cookbooks from a number of places.  Cookbooks that are specific to OpenStax and OpenStax Exchange live [on github](https://github.com/openstax/openstax_cookbooks).  If you find yourself needing to modify these cookbooks, clone the cookbook repository and then set the ````OPENSTAX_COOKBOOKS_PATH```` environment variable to the absolute path of the checked out cookbooks before running vagrant commands.  This will cause Vagrant and Berkshelf to use your local copy of the OpenStax cookbooks instead of the ones on Github. 