class minecraft {

	file{'/minecraft/':
		ensure => [directory, present],
	}

	file{'/minecraft/server.jar':
		owner   => root,
		ensure  =>  [file,present],
		mode    => '0750',
		source  => ["puppet:///modules/minecraft/server.jar",],
	}

}
