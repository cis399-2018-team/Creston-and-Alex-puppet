class apache {

	# install
	package{'httpd':
		ensure => latest,
	}
	
	#webpage resource
	file{'index.html':
		ensure  => file,
		path    => '/var/www/html/index.html',
		content => '<h1>Hello, World</h1>',
		require => Package['httpd'],
		owner   => root,
		mode    => '0600',
		notify  => Service['apache'],
	}

	#keeps service running
	service{'apache':
		ensure     => running,
		enable     => true,
		hasrestart => true, 
		require    => Package['httpd'],
	}
}
