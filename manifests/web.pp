exec { "node":
   command => "/usr/bin/curl --silent --location https://rpm.nodesource.com/setup | bash -"
}
package { [
		"curl", 
		"git"#, 
		#"java-1.8.0-openjdk-devel.x86_64",
		#"nodejs", 
		#"gcc-c++", 
		#"make"
	]:
    ensure => installed,
    require => Exec["node"]
}

