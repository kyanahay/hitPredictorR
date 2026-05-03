# hitPredictorR

hitPredictorR is an R package that estimates the hit potential of songs using a multi-factor scoring system based on Spotify audio features.

Instead of relying on black-box machine learning models, the package uses an interpretable scoring approach that allows users to understand how different musical characteristics contribute to a song’s potential success.

## Purpose

The goal of this package is to demonstrate how audio and metadata features can be combined into a structured, explainable model for predicting song popularity.

The model incorporates multiple dimensions of a song:

- **Engagement:** energy, danceability  
- **Mood:** valence  
- **Popularity signal:** popularity  
- **Audio structure:** loudness, tempo  
- **Content characteristics:** speechiness, instrumentalness, explicit content  

These factors are combined into a single score ranging from 0 to 100.

## Main Functions

- `predict_hit_score()` calculates a hit score using multiple audio features  
- `classify_song_hit()` categorizes songs into Low, Moderate, or High Potential  
- `feature_impact_analysis()` shows the contribution of each feature to the score  
- `plot_hit_factors()` visualizes feature importance  
- `top_hit_candidates()` returns the highest scoring songs


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
```

## Dataset 

This project uses a Spotify tracks dataset containing audio features such as energy, danceability, valence, popularity, loudness, tempo, speechiness, and instrumentalness.

## Object System

This package does not implement S3 or S4 classes, as its primary focus is on functional data processing and scoring. All functions operate directly on standard data frames to keep the package simple and accessible.

## AI Disclosure

AI tools were used to assist with brainstorming the package concept, structuring functions, and refining documentation. The final implementation, testing, dataset alignment, and modeling decisions were completed and verified by the author.

## Author

Kyana Hay
