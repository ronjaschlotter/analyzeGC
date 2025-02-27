#' @title Plot to evaluate peak alignment
#'
#' @description
#' Heat map + dendrogram of the chemical composition of samples within an
#' aligned data frame. The colors filling the heat map cells represent the
#' abundance of the compounds (columns), and the dendrogram indicates the
#' similarity between samples (rows).
#'
#' The plot facilitates the discovery of miss-alignments.
#'
#' It uses [gplots::heatmap.2] to produce the plot.
#'
#' If the received data frame contains only on sample, it returns a heatmap,
#' using ggplot2
#'
#' The data is transformed to the log(1 + x) before plotting, so the difference
#' between peaks with low abundance values (i.e x >= 5%) is observable.
#'
#' @param data
#'
#' The function can receive different data types from which to produce the
#' diagnostic plot:
#'
#' Aligned data, as obtained from [align_chromatograms2], for which you want to
#' evaluate its alignment. In this case, it calls area_norm to normalize
#' the aligned area data frame before producing the plot.
#'
#' An aligned data.frame of normalized abundance (area), as obtained from
#' area_norm.
#'
#' A corrected aligned data.frame as obtained from correct_alignment.
#'
#' @param title Character string with the text for the title of the plot
#'
#' @param alignment.type A character string indicating the type of alignment
#' ("automatic" or "corrected") the data comes from.
#'
#' automatic: Aligned data as obtained via align_chromatograms2, with or without
#' normalizing it via [area_norm].
#'
#' corrected: A corrected area data.frame, as obtained from [correct_alignment].
#'
#' @import dplyr
#' @import tidyr
#' @import ggplot2
#' @importFrom gplots heatmap.2
#'
#' @examples
#'
#' # Get the diagnostic heat map of a single aligned data set
#' Winter_IW <-
#'   aligned_samples_data_list$`Winter_In-hive workers_A. m. mellifera`
#'
#' diagnostic_heatmap(data =  Winter_IW
#'                    , title = "Alignment of IW CHCs"
#'                    , alignment.type = "automatic")
#'
#' # Get the diagnostic heat map of several aligned data sets within a list
#'
#' for (df in names(aligned_samples_data_list)) {
#'   diagnostic_heatmap(aligned_samples_data_list[[df]]
#'                      , title = paste0("Alignment of ", df)
#'                      , alignment.type = "automatic")
#' }
#'
#'
#' @export
diagnostic_heatmap <- function(data, title, alignment.type) {
  if (alignment.type == "automatic") {
    if (is.data.frame(data)) {
      test <- (100 * nrow(data))
      if (sum(rowSums(data)) == test) {
        df_area_norm <- data
      }
    } else {
      if (is.list(data)) {
        df_area_norm <- area_norm(data)
      }
    }
  }

  if (alignment.type == "corrected") {
    area_2_percent <- function(x) {
      x <- x / rowSums(x) * 100
      x
    }

    data <- data[["Area"]]
    df_area_norm <- area_2_percent(data)
  }

  heatmap_colors <- viridis::turbo(200)

  if (nrow(df_area_norm) > 1) {
    p <- gplots::heatmap.2(as.matrix(df_area_norm |> log1p())
                       , main = title
                       , srtCol = 90
                       , srtRow = 90
                       , offsetRow = 0.02
                       , offsetCol = 0.02
                       , dendrogram = "row"
                       # Ensures that the columns are not ordered
                       , Colv = "NA"
                       , trace = "none"
                       , key.xlab = "log(1 + x) of relative abundance (%)"
                       , col = heatmap_colors)
  } else {
    p <- df_area_norm |>
      mutate(sample = row.names(df_area_norm)) |>
      pivot_longer(cols = starts_with("P"),
                   names_to = "Peak",
                   values_to = "rel.abundance")  |>
      ggplot(aes(x = get("Peak"), y = get("sample"))) +
      geom_raster(aes(fill = log1p(get("rel.abundance")))) +
      scale_fill_viridis_c(option = "turbo"
                           , guide = guide_legend(
                             title = "log(1 + x) of relative abundance (%)")
                           ) +
      ggtitle(title) +
      labs(x = "Peak"
           , y = "sample")
      theme_classic()
  }
  # print(p)
  p
}
