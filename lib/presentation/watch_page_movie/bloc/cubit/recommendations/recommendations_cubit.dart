import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_app/domain/movies/usecase/recommendations_usecase.dart';
import 'package:movie_app/service_locator.dart';

part 'recommendations_state.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  RecommendationsCubit() : super(RecommendationsInitial());
  void getRecommendations(int movieId) async {
    var result = await sl<RecommendationsUsecase>().call(params: movieId);
    result.fold((error) {
      emit(RecommendationsError(error.toString()));
    }, (data) {
      emit(RecommendationsLoaded(data));
    });
  }
}
