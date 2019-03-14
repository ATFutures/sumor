
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sumor

The goal of sumor is to provide an interface to SUMO. Install and load
it with:

``` r
remotes::install_github("ATFutures/sumor")
library(sumor)
```

How to install SUMO?

``` r
install_SUMO()
#> To install sumo in Ubuntu, please add the ppa with:
#> sudo add-apt-repository ppa:sumo/stable
#> sudo apt-get update
#> sudo apt install sumo
#> To build from source, see:
#> https://github.com/eclipse/sumo#build-and-installation
```

What version is installed?

``` r
SUMO_version()
#> [1] "Eclipse SUMO Version v1_1_0+1270-8cf2e4800d"
```
