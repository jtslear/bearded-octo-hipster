class openssh-server {
	package { openssh-server:
		ensure => present,
	}
	service {
		'ssh':
			ensure => true,
			enable => true,
			require => Package['openssh-server']
	}
}

