class minecraft {
	
	exec { 'java':
		command => 'apt install openjdk-8-jre-headless curl screen nano bash grep',
	}

	file {'/opt/':
		ensure => [directory, present],
	}
	
	file {'/etc/systemd/system/minecraft@.service':
		ensure => file,
		mode   => 0750,
	}

	user { 'minecraft':
		ensure      => present,
		home        => /opt/minecraft/,
		shell       => /bin/bash,
		managehome  => true,
	}
}
