maintainer       "Ryan J. Geyer"
maintainer_email "me@ryangeyer.com"
license          "All rights reserved"
description      "Installs/Configures gitosis"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

%w{ubuntu debian redhat centos}.each do |os|
  supports os
end

%w{rightscale}.each do |dep|
  depends dep
end

recipe "gitosis::default","Just runs gitosis::install"
recipe "gitosis::install","Installs gitosis in the specified directory"

attribute "gitosis/gitosis_home",
  :display_name => "Gitosis Home Directory",
  :description => "The full path to the home directory for Gitosis",
  :default => "/mnt/gitosis-home",
  :recipes => ["gitosis::default", "gitosis::install"]

attribute "gitosis/gitosis_key",
  :display_name => "Gitosis Private Key",
  :description => "Private RSA (or DSA) key material to be used when initializing the gitosis repository/home. Set to ignore for a new key to be automatically generated.",
  :required => false,
  :recipes => ["gitosis::default", "gitosis::install"]