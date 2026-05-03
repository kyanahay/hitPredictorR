#' @title classify_song_hit
#' @description Classifies songs into hit potential categories based on their hit score.
#' @param data A dataframe containing song audio features.
#' @return A character vector of hit classifications.
#' @examples
#' test_data <- data.frame(
#'   energy = c(0.8, 0.6),
#'   danceability = c(0.7, 0.5),
#'   valence = c(0.6, 0.4),
#'   popularity = c(80, 50),
#'   loudness = c(-5, -10),
#'   tempo = c(120, 100),
#'   speechiness = c(0.05, 0.1),
#'   instrumentalness = c(0.0, 0.2),
#'   explicit = c(TRUE, FALSE)
#' )
#' classify_song_hit(test_data)
#' @export

classify_song_hit <- function(data) {

  score <- predict_hit_score(data)

  classification <- ifelse(
    score < 40, "Low Potential",
    ifelse(score < 70, "Moderate Potential", "High Potential")
  )

  return(classification)
}
