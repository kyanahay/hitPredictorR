#' @title predict_hit_score
#' @description Calculates a hit potential score (0–100) using audio and metadata features.
#' @param data A dataframe containing energy, danceability, valence, popularity, loudness, tempo, speechiness, instrumentalness, and explicit columns.
#' @return A numeric vector of hit scores.
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
#' predict_hit_score(test_data)
#' @export

predict_hit_score <- function(data) {

  pop_norm <- data$popularity / 100

  # Normalize loudness (-60 to 0 → 0 to 1)
  loud_norm <- (data$loudness + 60) / 60

  # Normalize tempo (assume 60–200 BPM)
  tempo_norm <- (data$tempo - 60) / (200 - 60)
  tempo_norm[tempo_norm < 0] <- 0
  tempo_norm[tempo_norm > 1] <- 1

  explicit_score <- as.numeric(data$explicit)

  score <- (
    # Energy & engagement
    (data$energy * 15) +
      (data$danceability * 15) +

      # Mood
      (data$valence * 10) +

      # Popularity
      (pop_norm * 20) +

      # Audio structure
      (loud_norm * 10) +
      (tempo_norm * 10) +

      # Content type
      ((1 - data$speechiness) * 5) +     # less speech = more musical
      ((1 - data$instrumentalness) * 5) + # vocals preferred
      (explicit_score * 10)
  )

  return(score)
}
