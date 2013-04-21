class java(
  $distribution = 'jdk',
  $version      = 'latest',
  $package      = undef,
  $jdk_package = 'openjdk-7-jdk',
  $jre_package = 'openjdk-7-jre-headless',
) {
  case $distribution {
    default: { fail('distribution must be one of jdk, jre') }
    'jdk': {
      $default_package_name = $jdk_package
    }
    'jre': {
      $default_package_name = $jre_package
    }
  }

  $use_java_package_name = $package ? {
    default => $package,
    undef   => $default_package_name,
  }

  package { 'java':
    ensure => $version,
    name   => $use_java_package_name,
  }

}
