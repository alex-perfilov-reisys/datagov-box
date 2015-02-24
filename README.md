##Installation steps

* ###Getting datagov project
 * `cd datagov-box`
 * `git clone https://github.com/GSA/datagov-deploy.git`
 * `cd datagov-deploy`
 * create `.env` file with content:
    ```
    DB_NAME=datagov
    DB_USER=root
    DB_PASSWORD=password
    DB_HOST=localhost

    WP_ENV=local
    WP_HOME=http://datagov.dev
    WP_SITEURL=http://datagov.dev/wp
    FORCE_SSL_ADMIN=false
    ```
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