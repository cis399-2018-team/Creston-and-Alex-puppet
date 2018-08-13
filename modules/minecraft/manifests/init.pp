class minecraft {
	

	file{'/server.jar':
		owner   => root,
		ensure  =>  file,
		mode    => '0750',
		source  => ["puppet:///modules/minecraft/files/server.jar",],
	}

}
