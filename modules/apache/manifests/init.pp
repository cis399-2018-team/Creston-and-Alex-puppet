class apache {

	# install
	package{'apache2':
		ensure => latest,
	}
	
	file{'/etc/apache2/apache2.conf':
		ensure  => present,
		source  => ["puppet:///modules/apache/apache2.conf",],
		require => Package['apache2'],
	}	

	#webpage resource
	file{'/var/www/html/index.html':
		ensure  => file,
		source  => ["puppet:///modules/apache/index.html",],
		recurse => true,
		require => Package['apache2'],
		notify  => Service['apache2'],
	}

	#keeps service running
	service{'apache2':
		ensure     => running,
		enable     => true,
		hasstatus  => true,
		hasrestart => true, 
		require    => [Package['apache2'], File["/etc/apache2/apache2.conf"], File["/var/www/html/index.html"]],
		subscribe  => File["/etc/apache2/apache2.conf"],
	}
}
