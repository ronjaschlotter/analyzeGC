
<!-- README.md is generated from README.Rmd. Please edit that file -->

# analyzeGC

<!-- badges: start -->
<!-- badges: end -->

This package was built for educational and research purposes in the
field of chemical ecology. The objective was to provide a tool set for
using R to analyze GC, and in particular GC-MS (GC coupled with
Mass-spectrometry) data, to establish a standardized and reproducible
workflow. As I mainly work with cuticular hydrocarbons (CHCs) the
workflow implied within the package was designed considering that
specific type of data. However, the workflow it suggests and most of the
functions can be used for analyzing other types of chemical ecology GC
data.

The package relies on the
[GCalignR](https://github.com/mottensmann/GCalignR) package for the
alignment of GC peaks data across samples, based on the retention time
of the peaks. A wrapper around the `GCalignR::align_chromatograms` is
defined within the package for this purpose.

The rest of the functions of the package are oriented to aid the further
correction of the peaks alignment, and preparation of the data for its
statistical analysis within R.

## Installation

You can install the development version of analyzeGC from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dsrodriguezl/analyzeGC"
  , dependencies = TRUE
  , build_vignettes = TRUE)
```

## Get started

To get started read the vignettes:

``` r
browseVignettes("analyzeGC")
```
