
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggmapstyles

[![Travis-CI Build
Status](https://travis-ci.org/mikey-harper/ggmapstyles.svg?branch=master)](https://travis-ci.org/mikey-harper/ggmapstyles)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/mikey-harper/ggmapstyles?branch=master&svg=true)](https://ci.appveyor.com/project/mikey-harper/ggmapstyles)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

-----

<img src="ggmapstylesCover.png" width="100%" style="display: block; margin: auto;" />

## Overview

**ggmapstyles** is an R package which extends the
[ggmap](https://github.com/dkahle/ggmap) package. This package simplifes
the process of creating custom designs for Google Maps, and provides a
range of tools for quickly loading themes from [Snazzy
Maps](https://snazzymaps.com/) by simply copying a website URL.

Say goodbye to the standard Google Maps background, and easily choose
from one of over 20000 custom themes\! If you cannot find a style you
like, it is easy to sign up and create your own customised layers.

> This package is still in development. If you find any errors, or have
> any suggestions for improvements, please open an
> [Issue](https://github.com/mikey-harper/ggmapstyles/issues).

A selection of some of the styles available are shown
below:

<img src="man/figures/README-maps-1.png" style="display: block; margin: auto;" />

## Installation

You can install the development version of the package through Github:

    devtools::install_github("dr-harper/ggmapstyles")

Google recently changed their API requirements, so you will need to
register with Google first. A useful guide is found in the **ggmaps**
package: <https://github.com/dkahle/ggmap>

## Usage

You can browse [Snazzy Maps](https://snazzymaps.com/) to find a style
you like. A number of functions have been developed to simplify the
usage of Snazzymaps within existing workflows.

The main function to use within the package is `get_snazzymap`. This is
a wrapper of the `get_googlemap` function, with the style of the map
being set by `mapRef`:

``` r
library(ggmapstyles)
basemap <- get_snazzymap("Southampton, UK", mapRef = "https://snazzymaps.com/style/83/muted-blue")
ggmap(basemap)
```

<img src="man/figures/README-exampleMap-1.png" style="display: block; margin: auto;" />

The `mapRef` parameter can accept the Snazzy Map reference in a number
of different ways:

  - Full URL: `mapRef = "https://snazzymaps.com/style/83/muted-blue"`
  - ID & Name: `mapRef = "83/muted-blue"`
  - ID: `mapRef = 83`

You can also supply additional arguments to the `get_snazzymap` function
which are provided to `get_googlemap`. For example, the zoom can be
changed as
follows:

``` r
basemap <- get_snazzymap("Southampton, UK", mapRef = "98/purple-rain", zoom = 15)
ggmap(basemap)
```

<img src="man/figures/README-themeTwo-1.png" style="display: block; margin: auto;" />

If you would rather use the `style` argument within the `get_googlemap`,
you can create a formatted string using the `ggmap_style_sm` function:

``` r
style_string <- ggmap_style_sm("84/pastel-tones")
style_string
#> [1] "feature:landscape%7Csaturation:-100%7Clightness:60&style=feature:road.local%7Csaturation:-100%7Clightness:40%7Cvisibility:on&style=feature:transit%7Csaturation:-100%7Cvisibility:simplified&style=feature:administrative.province%7Cvisibility:off&style=feature:water%7Cvisibility:on%7Clightness:30&style=feature:road.highway%7Celement:geometry.fill%7Ccolor:0xef8c25%7Clightness:40&style=feature:road.highway%7Celement:geometry.stroke%7Cvisibility:off&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0xb6c54c%7Clightness:40%7Csaturation:-40&style="
```

This string can then easily be reused within any other ggmap function
which takes a style argument. This approach is recommended if you want
to plot multiple maps with the same
basemap:

``` r
plot1 <- ggmap(get_googlemap("Southampton, UK", style = style_string)) + labs(title = "Southampton")
plot2 <- ggmap(get_googlemap("London, UK", style = style_string)) + labs(title = "London")
plot3 <- ggmap(get_googlemap("Bristol, UK", style = style_string)) + labs(title = "Bristol")

gridExtra::grid.arrange(plot1, plot2, plot3, ncol = 3)
```

<img src="man/figures/README-StyleStringMultiple-1.png" style="display: block; margin: auto;" />

## Cached Styles

16 map styles are supplied within the package. These can be accessed by
using the `map_styles()` function, and the following styles are
available:

|     ID | Name                   | Description                                                        |
| -----: | :--------------------- | :----------------------------------------------------------------- |
|     61 | Blue Essence           | A light blue style that helps you focus on content on the map.     |
|     35 | Avocado World          | A creamy green color palette.                                      |
|     98 | Purple Rain            | Everything on this map is a pleasant shade of desaturated purple.  |
|     84 | Pastel Tones           | Simple pastel look and feel.                                       |
|     64 | Old Dry Mud            | Orange with pale blue sea.                                         |
|   8097 | WY                     | Map style for WY default color scheme.                             |
|  60952 | apple-like             | Similar to Apple Maps.                                             |
|     23 | Bates Green            | A nice, simple green version of the map.                           |
|     83 | Muted Blue             | An unobtrusive blue design for minimal user-experiences.           |
| 127403 | No label Bright Colors | A map without label and brighter colors.                           |
|     14 | Vintage                | A dark two-tone map with a striking red color against a dark grey. |
|     68 | Aqua                   | A cool two tone map that looks great when zoomed in.               |
|     72 | Transport for London   | Style based on London transport maps.                              |
|   6296 | darkdetail             | minimal, dark grayscale, retaining POI labels.                     |
|     21 | Hopper                 | Based upon Edward Hopper’s paintings.                              |
|     40 | Vitamin C              | Inspired by the Adobe Kuler theme of the same name.                |
|  72543 | Assassin’s Creed IV    | Themed map matching the colors from Assassin’s Creed IV.           |

There are several ways you can use this function to refer to a style:

  - By name: `map_style("Blue Essence")`
  - By ID: `map_style(ID = "40")`
  - Pick one style at random: `map_style(random = TRUE)`: this also
    prints a message so that you know which style to reuse.

<!-- end list -->

``` r
# search by name
map_style("Blue Essence")
#> [1] "feature:landscape.natural%7Celement:geometry.fill%7Cvisibility:on%7Ccolor:0xe0efef&style=feature:poi%7Celement:geometry.fill%7Cvisibility:on%7Chue:0x1900ff%7Ccolor:0xc0e8e8&style=feature:road%7Celement:geometry%7Clightness:100%7Cvisibility:simplified&style=feature:road%7Celement:labels%7Cvisibility:off&style=feature:transit.line%7Celement:geometry%7Cvisibility:on%7Clightness:700&style=feature:water%7Celement:all%7Ccolor:0x7dcdcd"

# search by ID
map_style(ID = "40")
#> [1] "feature:water%7Celement:geometry%7Ccolor:0x004358&style=feature:landscape%7Celement:geometry%7Ccolor:0x1f8a70&style=feature:poi%7Celement:geometry%7Ccolor:0x1f8a70&style=feature:road.highway%7Celement:geometry%7Ccolor:0xfd7400&style=feature:road.arterial%7Celement:geometry%7Ccolor:0x1f8a70%7Clightness:-20&style=feature:road.local%7Celement:geometry%7Ccolor:0x1f8a70%7Clightness:-17&style=element:labels.text.stroke%7Ccolor:0xffffff%7Cvisibility:on%7Cweight:0.9&style=element:labels.text.fill%7Cvisibility:on%7Ccolor:0xffffff&style=feature:poi%7Celement:labels%7Cvisibility:simplified&style=element:labels.icon%7Cvisibility:off&style=feature:transit%7Celement:geometry%7Ccolor:0x1f8a70%7Clightness:-10&style=&style=feature:administrative%7Celement:geometry%7Ccolor:0x1f8a70%7Cweight:0.7"

# Use directly within ggmap function
ggmap::get_googlemap("Southampton", style = map_style("apple-like"))
#> Source : https://maps.googleapis.com/maps/api/staticmap?center=Southampton&zoom=10&size=640x640&scale=2&maptype=terrain&style=feature:administrative.country%7Celement:labels.text%7Clightness:29&style=feature:administrative.province%7Celement:labels.text.fill%7Clightness:-12%7Ccolor:0x796340&style=feature:administrative.locality%7Celement:labels.text.fill%7Clightness:15%7Csaturation:15&style=feature:landscape.man_made%7Celement:geometry%7Cvisibility:on%7Ccolor:0xfbf5ed&style=feature:landscape.natural%7Celement:geometry%7Cvisibility:on%7Ccolor:0xfbf5ed&style=feature:poi%7Celement:labels%7Cvisibility:off&style=feature:poi.attraction%7Celement:all%7Cvisibility:on%7Clightness:30%7Csaturation:-41%7Cgamma:0.84&style=feature:poi.attraction%7Celement:labels%7Cvisibility:on&style=feature:poi.business%7Celement:all%7Cvisibility:off&style=feature:poi.business%7Celement:labels%7Cvisibility:off&style=feature:poi.medical%7Celement:geometry%7Ccolor:0xfbd3da&style=feature:poi.medical%7Celement:labels%7Cvisibility:on&style=feature:poi.park%7Celement:geometry%7Ccolor:0xb0e9ac%7Cvisibility:on&style=feature:poi.park%7Celement:labels%7Cvisibility:on&style=feature:poi.park%7Celement:labels.text.fill%7Chue:0x68ff00%7Clightness:-24%7Cgamma:1.59&style=feature:poi.sports_complex%7Celement:all%7Cvisibility:on&style=feature:poi.sports_complex%7Celement:geometry%7Csaturation:10%7Ccolor:0xc3eb9a&style=feature:road%7Celement:geometry.stroke%7Cvisibility:on%7Clightness:30%7Ccolor:0xe7ded6&style=feature:road%7Celement:labels%7Cvisibility:on%7Csaturation:-39%7Clightness:28%7Cgamma:0.86&style=feature:road.highway%7Celement:geometry.fill%7Ccolor:0xffe523%7Cvisibility:on&style=feature:road.highway%7Celement:geometry.stroke%7Cvisibility:on%7Csaturation:0%7Cgamma:1.44%7Ccolor:0xfbc28b&style=feature:road.highway%7Celement:labels%7Cvisibility:on%7Csaturation:-40&style=feature:road.arterial%7Celement:geometry%7Ccolor:0xfed7a5&style=feature:road.arterial%7Celement:geometry.fill%7Cvisibility:on%7Cgamma:1.54%7Ccolor:0xfbe38b&style=feature:road.local%7Celement:geometry.fill%7Ccolor:0xffffff%7Cvisibility:on%7Cgamma:2.62%7Clightness:10&style=feature:road.local%7Celement:geometry.stroke%7Cvisibility:on%7Cweight:0.50%7Cgamma:1.04&style=feature:transit.station.airport%7Celement:geometry.fill%7Ccolor:0xdee3fb&style=feature:water%7Celement:geometry%7Csaturation:46%7Ccolor:0xa4e1ff&key=xxx
#> Source : https://maps.googleapis.com/maps/api/geocode/json?address=Southampton&key=xxx
#> 1280x1280 terrain map image from Google Maps. 
#> See ?ggmap to plot it.
```

## Additional Reading

[This
cheatsheet](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/ggmap/ggmapCheatsheet.pdf)
into ggmap is useful for picking up some of the basics of ggmap.
