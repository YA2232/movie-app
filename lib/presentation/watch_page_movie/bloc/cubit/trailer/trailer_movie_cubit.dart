import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/entity/trailer_entity.dart';
import 'package:movie_app/domain/movies/usecase/trailer_movie_usecase.dart';
import 'package:movie_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'trailer_movie_state.dart';

class TrailerMovieCubit extends Cubit<TrailerMovieState> {
  TrailerMovieCubit() : super(TrailerMovieInitial());
  void getTrailerMovie(int? movieId) async {
    var result = await sl<TrailerMovieUsecase>().call(params: movieId);
    result.fold((error) {
      emit(TrailerMovierError(error.toString()));
    }, (data) async {
      List<TrailerEntity> trailerEntity = data;
      TrailerEntity trailer = trailerEntity.first;

      final _controller = YoutubePlayerController(
        initialVideoId: trailer.key,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ),
      );
      emit(TrailerMovieLoaded(_controller));
    });
  }
}
