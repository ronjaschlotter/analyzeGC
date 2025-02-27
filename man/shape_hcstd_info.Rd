% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shape_hcstd_info.R
\name{shape_hcstd_info}
\alias{shape_hcstd_info}
\title{Shape the standards information data frame}
\usage{
shape_hcstd_info(
  comps_id.STD,
  aligned_std,
  short_long_splitted = TRUE,
  short_std_pattern,
  long_std_pattern,
  project_std = NULL
)
}
\arguments{
\item{comps_id.STD}{data frame with the compound information for the n-alkane standards.

The data frame should have a "Compound" and a "mean_RT" columns, plus a
column for every standard run.

The Compound column should have the name of the n-alkane standards with the
following format: C"numeric chain length"_ane_NA.
The rest of the data frame, is just as it can be obtained via the RT_df
function, or after alignment correction.}

\item{aligned_std}{An object holding the aligned standards, as obtained from
\link{align_chromatograms2}, or \link{recalculate_meanRT} in case their alignment
required to be corrected.}

\item{short_long_splitted}{Logical. Are the short and long standards separated?}

\item{short_std_pattern}{Character string pattern to identify the short chain-length standards (until
C20). The function relies on the dplyr::starts_with selection helper to do
so.}

\item{long_std_pattern}{Character string pattern to identify the long chain-length standards (from
C21). The function relies on the dplyr::starts_with selection helper to do
so.}

\item{project_std}{Numeric vector indicating the chain length of n-alkanes for which to
simulate the mean RTs. This is useful in case the standards do not include
n-alkanes around some peaks of interest within the samples, thus impeding
the calculation of the retention index of such peaks.
The simulation of the mean RTs is done by projecting the median distance
between neighboring standard peaks. The median distance between standards is
multiplied by the difference in chain length between the n-alkane to
simulate and the closest standard peak, to calculate the mean RT distance
between the corresponding peaks.
If the simulated n-alkane has a shorter chain length than all the standards,
the mean RT distance is subtracted from the mean RT of the closest standard
to calculate the mean RT value of the simulated n-alkane.
Note that this is not the most adequate procedure as the RT distance between
neighboring n-alkane peaks is not constant along a GC-run. It is always
better to have real standards.}
}
\description{
Function to shape the data frame holding the compound
information for n-alkane standards
}
\examples{

std_info <- shape_hcstd_info(comps_id.STD = comps_id_std
                             , aligned_std = aligned_standards
                             , short_std_pattern = "L"
                             , long_std_pattern = "H")

}
