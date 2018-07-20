node ip-10-0-6-195 {
        include 'sshd' 
	cron { "puppet update":
		command => "cd /etc/puppet && git pull -q origin master",
		user    => root,
		minute  => "*/5",
	}
}

node ip-10-0-6-98 {
    include 'sshd'
    include 'apache'
}

node ip-10-0-6-209 {
    include 'sshd' 
    include 'apache'
}
