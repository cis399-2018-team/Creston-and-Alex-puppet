class minecraft {
	
	exec {'java':
		command => 'apt install openjdk-8-jre-headless curl screen nano bash grep',
		path    => '/opt/',
		require => File['/opt/'],
	}

	file {'/opt/':
		ensure => [directory, present],
	}
	
	file {'/etc/systemd/system/minecraft@.service':
		ensure => file,
		mode   => '0750',
		source => "puppet:///module/minecraft/minecraft@.service",
	}

	user {'minecraft':
		ensure      => present,
		home        => '/opt/minecraft/',
		shell       => '/bin/bash',
		managehome  => true,
	}
}
