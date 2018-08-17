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
		source             => ["puppet:///modules/minecraft/minecraft.service"],
		source_permissions => use,
		links              => manage,
		mode               => '0750',
		owner              => 'root',		
	}
	
	file {'/opt/minecraft/vanilla/server.jar':
		path    => '/opt/minecraft/vanilla/server.jar',
		ensure  => [file, present],
		source  => ["puppet:///modules/minecraft/server.jar"],
		mode    => '0750',
	}
	
	cron { "eula.txt":
		command => "echo "eula=true" > /opt/minecraft/vanilla/eula.txt",
		user    => root,
		ensure  => present,
	}
}
