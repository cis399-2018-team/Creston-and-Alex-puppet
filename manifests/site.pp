node ip-10-0-6-195 {
        include 'sshd' 
	cron { "puppet update":
		command => "cd /etc/puppet && git pull -q origin master",
		user    => root,
		second  => "*/30",
	}
}

node ip-10-0-6-169 {
   mod 'puppetlabs-java', '3.0.0',
   include 'sshd'
   include 'minecraft'
}

node ip-10-0-6-98 {
    include 'sshd'
    include 'apache'
}

node ip-10-0-6-209 {
    include 'sshd' 
    include 'apache'
}
