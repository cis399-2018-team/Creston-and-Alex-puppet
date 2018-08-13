class minecraft {
	

	file{'/server.jar':
		ensure  =>  file,
		source  => ["puppet:///modules/minecraft/files/server.jar",],
	}

}
