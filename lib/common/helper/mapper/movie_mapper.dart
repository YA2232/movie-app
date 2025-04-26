import 'package:movie_app/data/movies/model/movie_model.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieModel moviemodel) {
    return MovieEntity(
      id: moviemodel.id,
      title: moviemodel.title,
      overview: moviemodel.overview,
      posterPath: moviemodel.posterPath,
      backdropPath: moviemodel.backdropPath,
      voteAverage: moviemodel.voteAverage,
      releaseDate: moviemodel.releaseDate,
    );
  }
}
