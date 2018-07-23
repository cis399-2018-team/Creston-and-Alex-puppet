class apache {

	# install
	package{'apache2':
		ensure => latest,
	}
	
	file{'/etc/apache2/apache2.conf':
		ensure  => present,
		source  => ["puppet:///modules/apache/files/apache2.conf"],
		require => Package['apache2'],
	}	

	#webpage resource
	file{'/var/www/html':
		ensure  => directory,
		source  => ["puppet:///modules/apache/files/html",],
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
