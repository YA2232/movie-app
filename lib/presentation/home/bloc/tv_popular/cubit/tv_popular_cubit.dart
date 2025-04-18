import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/tv/entity/tv_entity.dart';
import 'package:movie_app/domain/tv/usecase/tv_popular_usecase.dart';
import 'package:movie_app/service_locator.dart';

part 'tv_popular_state.dart';

class TvPopularCubit extends Cubit<TvPopularState> {
  TvPopularCubit() : super(TvPopularInitial());
  void getPopularTv() async {
    var result = await sl<TvPopularUsecase>().call();
    result.fold((error) {
      emit(TvPopularError(error.toString()));
    }, (data) {
      emit(TvPopularLoaded(data));
    });
  }
}
