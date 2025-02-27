#' @title Normalize aligned area data frame
#'
#' @description
#' Function to normalize the aligned area data frame produced by
#' [align_chromatograms2].
#'
#' It is a wrapper around [GCalignR::norm_peaks].
#'
#' It facilitates the usage of the function with [lapply], but its main purpose
#' is to be called within [diagnostic_heatmap].
#' By default set the rt_col_name to "RT", and conc_col_name to "Area".
#'
#' Automatically labels each peak as P1 to Pn, where n  =  number of peaks
#' in the data set.
#'
#' @param aligned_data An aligned data set as produced by [align_chromatograms2]
#'
#' @examples
#'
#' # Normalize a single aligned data set
#' Winter_IW <-
#'   aligned_samples_data_list$`Winter_In-hive workers_A. m. mellifera`
#'
#' norm_winter_IW <- area_norm(Winter_IW)
#'
#' # Normalize several aligned data sets within a list
#' samples_area_norm_list <- aligned_samples_data_list |>
#'   lapply(area_norm)
#'
#' @export
area_norm <- function(aligned_data){
  if (length(aligned_data) > 2) {
    df_area_norm <- GCalignR::norm_peaks(data = aligned_data
                               , rt_col_name = "RT"
                               , conc_col_name = "Area") |>
      t() |> as.data.frame()
  } else {
    df <- aligned_data$Area

    df_area_norm <- df[2] /
      colSums(df[2]) *
      100
  }

  rownames(df_area_norm) <- paste0("P", 1:nrow(df_area_norm))
  df_area_norm <- df_area_norm |>
    t() |> as.data.frame()
  df_area_norm
}
