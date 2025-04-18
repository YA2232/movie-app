import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_app/domain/movies/usecase/movies_usecase.dart';
import 'package:movie_app/service_locator.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());
  void getPopularMovies() async {
    var result = await sl<MoviesUsecase>().call();
    result.fold((error) {
      emit(PopularError(error.toString()));
    }, (data) {
      emit(PopularLoaded(data));
    });
  }
}
