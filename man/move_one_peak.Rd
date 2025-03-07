% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/move_one_peak.R
\name{move_one_peak}
\alias{move_one_peak}
\title{Move one peak up or down in an aligned data set}
\usage{
move_one_peak(df, Sample, Peak, Dir)
}
\arguments{
\item{df}{Aligned data frame as obtained with the area_df or RT_df functions.}

\item{Sample}{Character string indicating the name of the sample within
which to displace the peak ara/RT value.}

\item{Peak}{Character string indicating the peak label of the row containing
the value to be displaced.}

\item{Dir}{character string indicating the direction in which the area/RT
value of should be displaced within the column of the indicated sample
("up" or "down").}
}
\description{
Function for "manually" moving one peak of one sample one row
bellow/above on an aligned data frame. It is called by correct_alignment for
manual displacements of peak values within samples in an aligned data frame,
during the alignment correction process.
}
