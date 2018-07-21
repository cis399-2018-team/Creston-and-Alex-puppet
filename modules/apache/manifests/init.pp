class apache {

	# install
	package{'apache2':
		ensure => latest,
	}
	
	#webpage resource
	file{'index.html':
		ensure  => file,
		path    => '/var/www/html/index.html',
		source  => ["puppet:///modules/apache/index.html",],
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
