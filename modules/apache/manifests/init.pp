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
		owner   => root,
		mode    => '0600',
		notify  => Service['apache'],
	}

	#keeps service running
	service{'httpd':
		ensure     => running,
		enable     => true,
		hasrestart => true, 
		require    => Package['apache2'],
	}
}
