# hitPredictorR

hitPredictorR is a simple R package that estimates the hit potential of songs using Spotify audio features.

The package uses an interpretable scoring system based on energy, danceability, valence, and popularity. Instead of using a black-box machine learning model, the package creates a clear score that can be explained and adjusted.

## Purpose

hitPredictorR is an R package that estimates the hit potential of songs using a multi-factor scoring system based on Spotify audio features.

The model incorporates engagement (energy, danceability), mood (valence), popularity, audio structure (loudness, tempo), and content characteristics (speechiness, instrumentalness, explicit content) to produce an interpretable score from 0 to 100.

## Main Functions

- `predict_hit_score()` calculates a hit score using multiple audio features.
- `classify_song_hit()` categorizes songs into Low, Moderate, or High Potential.
- `feature_impact_analysis()` shows the contribution of each feature to the score.
- `plot_hit_factors()` visualizes feature importance.
- `top_hit_candidates()` returns the highest scoring songs.

## Example

```r
test_data <- data.frame(
  energy = c(0.8, 0.6),
  danceability = c(0.7, 0.5),
  valence = c(0.6, 0.4),
  popularity = c(80, 50),
  loudness = c(-5, -10),
  tempo = c(120, 100),
  speechiness = c(0.05, 0.1),
  instrumentalness = c(0.0, 0.2),
  explicit = c(TRUE, FALSE)
)

predict_hit_score(test_data)


Dataset

This project uses a Spotify tracks dataset containing audio features such as energy, danceability, valence, and popularity.

AI Disclosure

AI tools were used to assist with brainstorming the package concept, improving code structure, and refining documentation. The final package structure, function testing, dataset selection, and project decisions were reviewed and implemented by the author.

Author
Kyana Hay
