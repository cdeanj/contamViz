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
#' @examples
#' physeq <- readRDS(system.file("extdata", "MUClite.rds", package="decontam"))
#' contam_results <- decontam::isContaminant(physeq, method = 'frequency', conc="quant_reading")
#' plot_score_statistics(contam_results)
plot_score_statistics <- function(x) {
  if(nrow(x) == 0) { stop("Data frame is empty") }

  x <- x[!is.na(x$p),]

  ggp <- ggplot(x, aes(x = p)) +
    geom_histogram() +
    labs(x = "Score statistic", y = "Frequency") +
    theme_minimal()

  return(ggp)
}
