class minecraft {

	file{'/home/ubuntu/minecraft/':
		ensure => [directory, present],
	}

	file{'/home/ubuntu/minecraft/server.jar':
		owner   => root,
		ensure  =>  [file,present],
		mode    => '0750',
		source  => ["puppet:///modules/minecraft/server.jar",],
	}

}
