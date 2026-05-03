feature_impact_analysis <- function(data) {

  pop_norm <- data$popularity / 100
  loud_norm <- (data$loudness + 60) / 60
  tempo_norm <- (data$tempo - 60) / (200 - 60)
  tempo_norm[tempo_norm < 0] <- 0
  tempo_norm[tempo_norm > 1] <- 1
  explicit_score <- as.numeric(data$explicit)

  impact <- data.frame(
    feature = c("energy", "danceability", "valence", "popularity",
                "loudness", "tempo", "speechiness", "instrumentalness", "explicit"),
    contribution = c(
      mean(data$energy * 15, na.rm = TRUE),
      mean(data$danceability * 15, na.rm = TRUE),
      mean(data$valence * 10, na.rm = TRUE),
      mean(pop_norm * 20, na.rm = TRUE),
      mean(loud_norm * 10, na.rm = TRUE),
      mean(tempo_norm * 10, na.rm = TRUE),
      mean((1 - data$speechiness) * 5, na.rm = TRUE),
      mean((1 - data$instrumentalness) * 5, na.rm = TRUE),
      mean(explicit_score * 10, na.rm = TRUE)
    )
  )

  return(impact)
}
