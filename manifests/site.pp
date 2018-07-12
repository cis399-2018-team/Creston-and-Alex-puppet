node ip-10-0-6-195 {
	cron { "puppet update":
		command => "cd /etc/puppet && git pull -q origin master",
		user    => root,
		minute  => "*/5",
	}
}

node ip-10-0-6-146 {
}

node ip-10-0-6-98 {
}
