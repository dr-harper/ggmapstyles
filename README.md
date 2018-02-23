
<!-- README.md is generated from README.Rmd. Please edit that file -->
ggmapstyles <img src="man/images/snazzymaps.JPG" align="right" />
=================================================================

[![Travis-CI Build Status](https://travis-ci.org/mikey-harper/ggmapstyles.svg?branch=master)](https://travis-ci.org/mikey-harper/ggmapstyles) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/mikey-harper/ggmapstyles?branch=master&svg=true)](https://ci.appveyor.com/project/mikey-harper/ggmapstyles)

------------------------------------------------------------------------

Overview
--------

**ggmapstyles** is an R package which extends the [ggmap](https://github.com/dkahle/ggmap) package. This package simplifes the process of creating custom designs for Google Maps, and provides a range of tools for quickly loading themes from [Snazzy Maps](https://snazzymaps.com/) by simply copying a website URL.

Say goodbye to the standard Google Maps background, and easily choose from one of over 1.610^{4} custom themes! If you cannot find a style you like, it is easy to sign up and create your own customised layers.

![](man/figures/README-unnamed-chunk-2-1.png)

Installation
------------

You can install the development version of the package through Github. It is also recommended that you install the development version of ggmap, as this has increased the size of the maximum URL allowed and allows for more complex styles to be created.

    devtools::install_github("mikey-harper/ggmapstyles")
    devtools::install_github("dkahle/ggmap")

Usage
-----

You can browse [Snazzy Maps](https://snazzymaps.com/) to find a style you like. A number of functions have been developed to simplify the usage of Snazzymaps within existing workflows.

The main function to use within the package is `get_snazzymap`. This is a wrapper of the `get_googlemap` function, with the style of the map being set by `mapRef`:

![](man/figures/README-unnamed-chunk-3-1.png)

The `mapRef` parameter can accept the Snazzy Map reference in a number of different ways:

-   Full URL: `mapRef = "https://snazzymaps.com/style/83/muted-blue"`
-   ID & Name: `mapRef = "83/muted-blue"`
-   ID: `mapRef = 83`

You can also supply additional arguments to the `get_snazzymap` function which are provided to `get_googlemap`. For example, the zoom can be changed as follows:

![](man/figures/README-unnamed-chunk-4-1.png)
