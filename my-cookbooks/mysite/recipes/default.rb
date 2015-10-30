include_recipe "apache2"

web_app "my_site" do
  server_name "my-site.dev"
  server_aliases ["www.my-site.dev"]
  docroot "/var/www/mysite"
end
