class sshd {
    #install
    package{'openssh-server':
        ensure => latest,
    } 
    
    #shares the config file
    file{'sshd_config':
        ensure => file.
        path => '/etc/ssh/sshd_config', #ensure this file exists, if not copy from source
        owner => 'root',
        mode => '0600',
        source => 'puppet:///modules/sshd/sshd_config',
        require => Package['openssh-server'],
        notify => Service['sshd']
    }
    #keeps the service running.
    service['sshd':
       ensure => running,
       enable => true,
       require => Package['openssh-server']
    }

}
