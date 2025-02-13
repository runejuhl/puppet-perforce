# =Class perforce
#
# ==Description
# install and configure perforce
#
class perforce (
  String $user,
  String $service_name,
  String $service_password,
  String $service_port,
  String $service_root,
  Optional[String] $license_content,
  Optional[String] $service_ssldir,
){

  contain perforce::repository
  contain perforce::package
  contain perforce::install
  contain perforce::configure
  contain perforce::service
  contain perforce::license

  Class['::perforce::repository']
  -> Class['::perforce::package']
  -> Class['::perforce::install']
  -> Class['::perforce::license']
  -> Class['::perforce::configure']
  ~> Class['::perforce::service']
}
