default[:gitosis][:gitosis_home] = "/mnt/gitosis-home"
default[:gitosis][:uid] = "git"
default[:gitosis][:gid] = "gitusers"
default[:gitosis][:backup_history_to_keep] = 7

case node[:platform]
  when "ubuntu", "debian"
    default[:gitosis][:package_list] = ["git-core", "git-daemon-run", "python-setuptools"]
  when "centos", "fedora", "redhat"
    default[:gitosis][:package_list] = ["git", "git-daemon", "python-setuptools"]
end