class minecraft {
	
	cron { "java":
		command => "apt-get install openjdk-8-jre-headless curl screen nano bash grep",
		user    => root,
		ensure  => present,
	}

	file {'/opt/':
		path   => '/opt/',
		ensure => [directory, present],
		
	}
	
	file {'/etc/systemd/system/minecraft.service':
		path               => '/etc/systemd/system/minecraft.service',
		ensure             => [file,present],
		mode               => '0750',
		source             => ["puppet:///module/minecraft/minecraft.service"],
		source_permissions => use,
		links              => manage,
		user               => root,
	}
}
