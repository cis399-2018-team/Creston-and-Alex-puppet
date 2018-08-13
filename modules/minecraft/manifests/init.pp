class minecraft {
	

	file{'/etc/server.jar'':
		ensure  =>  file,
		recurse => true,
		source  => ["puppet:///modules/minecraft/files/server.jar",],
	}

}
