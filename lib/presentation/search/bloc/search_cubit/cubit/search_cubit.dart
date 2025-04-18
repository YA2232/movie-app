import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_app/domain/movies/usecase/search_movie_usecase.dart';
import 'package:movie_app/domain/tv/entity/tv_entity.dart';
import 'package:movie_app/domain/tv/usecase/search_tv_usecase.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option/cubit/selectabe_option_cubit.dart';
import 'package:movie_app/service_locator.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  void search(String query, SearchType searchType) {
    emit(SearchLoading());
    switch (searchType) {
      case SearchType.movie:
        searchMovie(query);
        break;
      case SearchType.tv:
        searchTv(query);
        break;
    }
  }

  void searchMovie(String query) async {
    var result = await sl<SearchMovieUsecase>().call(params: query);
    result.fold((error) {
      emit(SearchError(error.toString()));
    }, (data) {
      emit(SearchMovieLoaded(data));
    });
  }

  void searchTv(String query) async {
    var result = await sl<SearchTvUsecase>().call(params: query);
    result.fold((error) {
      emit(SearchError(error.toString()));
    }, (data) {
      emit(SearchTvLoaded(data));
    });
  }
}
