#' Plot score statistics output from decontam
#'
#' @description
#' A visualization of the distribution of score statistics output from the decontam package (Davis et al., 2018).  As the program authors note, a visualization of the score statistics is needed to inform a threshold for which to determine if a sequence feature is a contaminant or not.
#'
#' @param x A data.frame of classification information output from the isContaminant function in the decontam package.
#'
#' @return A ggplot object showing the distribution of score statistics assigned to each sequence feature.
#' @export
#'
#' @import decontam
#' @import ggplot2
#' @import phyloseq
#'
#' @examples
#' physeq <- readRDS(system.file("extdata", "MUClite.rds", package="decontam"))
#' contam_results <- decontam::isContaminant(physeq, method = 'frequency', conc="quant_reading")
#' plot_score_statistics(contam_results)
plot_score_statistics <- function(x) {
  if(nrow(x) == 0) { stop("Data frame is empty") }

  x <- x[!is.na(x$p),]
  x <- x[x$prev > 1,]

  x$s_p <- ifelse(x$prev == 2, "2",
           ifelse(x$prev > 2 & x$prev <= 7, "3-7",
           ifelse(x$prev > 7 & x$prev <= 18, "8-18", "18+")))

  x$s_p <- factor(x$s_p, levels = c("2", "3-7", "8-18", "18+"))

  default_color_palette <- c(
    "#bccfb4",
    "#94bb83",
    "#339444",
    "#09622a"
  )

  ggp <- ggplot(x, aes(x = p, fill = s_p)) +
    geom_histogram() +
    labs(x = "Score statistic", y = "Frequency", fill = "Prevalence") +
    scale_fill_manual(values = default_color_palette) +
    theme_minimal()

  return(ggp)
}
