class minecraft {
	
	file{'/home/minecraft/':
		owner   => root,
		ensure  => [directory, present],
		notify  => File['/minecraft/server.jar'],
	}

	file{'/home/minecraft/server.jar':
		owner   => root,
		ensure  =>  [file,present],
		mode    => '0750',
		source  => ["puppet:///modules/minecraft/server.jar",],
		require => File['/minecraft/'],
	}

}
