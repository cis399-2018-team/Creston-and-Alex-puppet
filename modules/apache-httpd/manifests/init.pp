class apache {

	# install
	package{'apache2':
		ensure => latest,
	}
	
	#webpage resource
	file{'index.html':
		ensure  => file,
		path    => '/var/www/html/index.html',
		content => '<h1>Hello, World</h1>',
		require => Package['apache2'],
		notify  => Service['httpd'],
	}

	#keeps service running
	service{'apache':
		ensure     => running,
		enable     => true,
		hasrestart => true, 
		require    => Package['apache2'],
	}
}
