#' Install SUMO
#'
#' See installation options here:
#' https://sumo.dlr.de/wiki/Simulation_of_Urban_MObility_-_Wiki
#'
#' @export
install_SUMO = function() {

  # verify os
  is_linux = Sys.info()['sysname'] == "Linux"
  is_mac = Sys.info()['sysname'] == "Darwin" # is that right?
  is_win = Sys.info()['sysname'] == "Windows" # is that right?

  if (!is_linux) {
    # replace with windows/mac installation ...
    stop("Unable to install SUMO. Only Linux is supported (for now).")
  } else if (is_linux) {
    type = Sys.info()['version']
    if(grepl(pattern = "Ubuntu", type)) {
      message("To install sumo in Ubuntu, please add the ppa with:")
      message("sudo add-apt-repository ppa:sumo/stable\nsudo apt-get update")
      message("sudo apt install sumo")
      message("To build from source, see:\n",
              "https://github.com/eclipse/sumo#build-and-installation")
    }
  }

  cat("\nInstallation complete.\n\n")

}

