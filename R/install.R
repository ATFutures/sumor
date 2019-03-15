#' Install SUMO
#'
#' See installation options here:
#' https://sumo.dlr.de/wiki/Simulation_of_Urban_MObility_-_Wiki
#'
#' This will provide OS-specific instructions for installing SUMO.
#' Test your installation has worked with: `SUMO_version()`
#'
#' @export
install_SUMO = function() {

  # verify os
  is_linux = Sys.info()['sysname'] == "Linux"
  is_mac = Sys.info()['sysname'] == "Darwin" # is that right?
  is_win = Sys.info()['sysname'] == "Windows" # is that right?

  install_mac <- function(){
    #  reference: https://sumo.dlr.de/wiki/Installing/MacOS_Build_w_Homebrew
    system('ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
           ')
    system('HOMEBREW_NO_AUTO_UPDATE=1 brew tap dlr-ts/sumo')
    system('HOMEBREW_NO_AUTO_UPDATE=1 brew install sumo')
  }


  if(is_mac) {
    is_exist_mac <- system("brew list |grep sumo",intern = TRUE) == "sumo"

    if(is_exist_mac){
      message(sprintf("SUMO is already exist under %s", SUMO_version()))
    } else {
      install_mac()
    }
  } else if (is_win) {
    # replace with windows/mac installation ...
    message("please manually download from https://www.dlr.de/ts/en/Portaldata/16/Resources/projekte/sumo/sumo-win64-1.1.0.msi")
    stop("Unable to install SUMO. Windows is not supported (for now).")
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

}
#' @export
#' @rdname install_SUMO
SUMO_version = function() {
  system("sumo --version", intern = TRUE)[1]
}
