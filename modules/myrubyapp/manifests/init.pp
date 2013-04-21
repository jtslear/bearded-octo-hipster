class myrubyapp {

	group { "apps": 
	  ensure => 'present',
	}

	user { "apps":
	  ensure => 'present',
	  gid => "apps",
	  managehome => false,
	  home => "/opt/apps",
	  shell => "/bin/bash",
	  require => Group["apps"],
	}

	file { "/opt/apps/":
	  ensure => 'directory',
	  owner => "apps",
	  group => "apps",
	  mode => '700',
	  require => User["apps"],
	}

	file { "/opt/apps/.bashrc":
	  ensure => 'present',
	  owner => 'apps',
	  group => 'apps',
	  mode => '700',
	  source => 'puppet:///modules/myrubyapp/.bashrc',
	  require => File['/opt/apps/'],
	}	

	file { "/opt/apps/.profile":
	  ensure => 'present',
	  owner => 'apps',
	  group => 'apps',
	  mode => '700',
	  source => 'puppet:///modules/myrubyapp/.profile',
	  require => File['/opt/apps/'],
	}	

	rbenv::install { 'apps':
	  home => '/opt/apps',
	  require => User['apps'],
	}

	rbenv::compile { 'apps/2.0.0-p0':
	  user => 'apps',
	  home => '/opt/apps',
	  ruby => '2.0.0-p0',
	  global => true,
	  require => Rbenv::Install['apps'],
	}

	rbenv::plugin { "rbenv-bundler":
	  user => 'apps',
	  home => '/opt/apps',
	  source => 'git://github.com/carsomyr/rbenv-bundler.git',
	  require => Rbenv::Install['apps'],
	}

}
