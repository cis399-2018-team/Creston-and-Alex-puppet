class minecraft {

	file{'/etc/minecraft/':
		ensure => [directory, present],
	}

	file{'/etc/minecraft/server.jar':
		owner   => root,
		ensure  =>  [file,present],
		mode    => '0750',
		source  => ["puppet:///modules/minecraft/server.jar",],
	}

}
