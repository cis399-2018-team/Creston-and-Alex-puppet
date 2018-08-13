mod 'puppet-minecraft', '4.0.0',

class minecraft {
	

	file{'server.jar':
		ensure  =>  file,
		source  => ["puppet:///modules/minecraft/files/server.jar",],
	}

}
