
<!-- README.md is generated from README.Rmd. Please edit that file -->

# analyzeGC

<!-- badges: start -->
<!-- badges: end -->

analyzeGC was built for educational and research purposes for chemical
ecology. The objective was to provide a tool set for using R to analyze
GC, and in particular GC-MS (GC coupled with Mass-spectrometry) data, to
establish a standardized and reproducible workflow. As I mainly work
with cuticular hydrocarbons (CHCs) the workflow implied within the
package was  
designed considering that specific type of data. However, most of the
functions should be useful for analyzing other types of chemical ecology
GC data.

The package provides a couple of functions to prepare the data as
obtained from the propietary GC software to be able to perform the peak
alignment.

The package relies on the
[GCalignR](https://github.com/mottensmann/GCalignR) package for the
alignment of GC peaks data across samples, based on the retention time
of the peaks. A wrapper around the `GCalignR::align_chromatograms` is
defined within the package for this purpose.

The rest of the functions of the package are oriented to aid in the
further correcting of the peak alignments, and preparation for the data
for its statistical analysis within R.

## Installation

You can install the development version of analyzeGC from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dsrodriguezl/analyzeGC")
```

## Get started

To get started read the vignettes:

``` r
browseVignettes("GCalignR")
```
