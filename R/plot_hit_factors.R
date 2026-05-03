#' @title plot_hit_factors
#' @description Creates a bar plot showing feature contributions to the hit score.
#' @param data A dataframe containing song audio features.
#' @return A ggplot bar chart.
#' @examples
#' test_data <- data.frame(
#'     energy = c(0.8, 0.6),
#'   danceability = c(0.7, 0.5),
#'   valence = c(0.6, 0.4),
#'   popularity = c(80, 50),
#'   loudness = c(-5, -10),
#'   tempo = c(120, 100),
#'   speechiness = c(0.05, 0.1),
#'   instrumentalness = c(0.0, 0.2),
#'   explicit = c(TRUE, FALSE)
#' )
#' plot_hit_factors(test_data)
#' @import ggplot2
#' @export

plot_hit_factors <- function(data) {

  impact <- feature_impact_analysis(data)

  ggplot2::ggplot(impact, ggplot2::aes(x = .data$feature, y = .data$contribution)) +
    ggplot2::geom_bar(stat = "identity") +
    ggplot2::labs(
      title = "Feature Contribution to Hit Score",
      x = "Audio Feature",
      y = "Average Contribution"
    )
}
