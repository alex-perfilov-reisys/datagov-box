

web_app "datagov" do
  server_name "datagov.dev"
  server_aliases ["www.datagov.dev"]
  docroot "/vagrant/datagov-deploy/web/"
  allow_override ["All"]
  directory_index ["index.php"]
end

# Install wp-cli
remote_file "/usr/local/bin/wp" do
  source 'https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
  mode 0755
  action :create_if_missing
end

# Disable saml plugin, change admin password to "password"
bash "disable-saml" do
	user "vagrant"
	cwd "/vagrant/datagov-deploy/web/"
	code <<-EOH
	wp plugin deactivate saml-20-single-sign-on
	wp user update admin --user_pass=password
	EOH
end