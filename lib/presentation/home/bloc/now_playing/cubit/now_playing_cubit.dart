import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_app/domain/movies/usecase/now_playing_usecase.dart';
import 'package:movie_app/service_locator.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingInitial());
  void getNowPlayingMovies() async {
    var result = await sl<NowPlayingUsecase>().call();
    result.fold((error) {
      emit(NowPlayingError(error.toString()));
    }, (data) {
      emit(NowPlayingLoaded(data));
    });
  }
}
