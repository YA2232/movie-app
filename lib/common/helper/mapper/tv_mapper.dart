import 'package:movie_app/data/tv/model/tv_model.dart';
import 'package:movie_app/domain/tv/entity/tv_entity.dart';

class TvMapper {
  static TvEntity toEntity(TvModel tv) {
    return TvEntity(
        id: tv.id,
        name: tv.name,
        overview: tv.overview,
        posterPath: tv.posterPath,
        backdropPath: tv.backdropPath,
        voteAverage: tv.voteAverage,
        firstAirDate: tv.firstAirDate);
  }
}
