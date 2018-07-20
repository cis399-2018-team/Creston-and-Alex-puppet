class apache {

	# install
	package{'apache2':
		ensure => latest,
	}
	
	#webpage resource
	file{'/var/www/html/index.html':
		ensure  => file,
		path    => '/var/www/html/index.html',
		content => '<h1>Hello, World</h1>',
		require => Package['apache2'],
		notify  => Service['apache2'],
	}

	#keeps service running
	service{'apache2':
		ensure     => running,
		enable     => true,
		hasrestart => true, 
		require    => Package['apache2'],
	}
}
