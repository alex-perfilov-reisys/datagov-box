[![forthebadge](http://forthebadge.com/images/badges/fuck-it-ship-it.svg)](http://forthebadge.com)

##Installation steps

* ###Getting datagov project
 * `cd datagov-box`
 * `git clone https://github.com/GSA/datagov-deploy.git`

* ###Get a fresh database
 * put fresh `datagov.sql` file into `datagov-box` folder

* ###Setting up virtual machine
 * install virtualbox https://www.virtualbox.org/wiki/Downloads
 * install vagrant https://www.vagrantup.com/downloads
 * `vagrant plugin install vagrant-omnibus`

 * `sudo gem install librarian-chef`
 * `librarian-chef install`

 * get somewhere `datagov.sql` and put it to `datagov-box` folder
 * add `datagov.dev` host to your hosts file (`/etc/hosts` or whatever you use)

  ```
  192.168.33.10   datagov.dev www.datagov.dev
  ```

 * `vagrant up`
 * Open http://datagov.dev/ in your browser, use `admin` :: `password` for admin panel http://datagov.dev/wp/wp-login.php
