import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_clinte.dart';
import 'package:movie_app/data/movies/repo/movire_repo_impl.dart';
import 'package:movie_app/data/movies/source/movie_source.dart';
import 'package:movie_app/data/tv/repo/tv_repo_impl.dart';
import 'package:movie_app/data/tv/source/tv_source.dart';
import 'package:movie_app/domain/movies/repo/movie_repo.dart';
import 'package:movie_app/domain/movies/usecase/movies_usecase.dart';
import 'package:movie_app/domain/movies/usecase/now_playing_usecase.dart';
import 'package:movie_app/domain/movies/usecase/recommendations_usecase.dart';
import 'package:movie_app/domain/movies/usecase/search_movie_usecase.dart';
import 'package:movie_app/domain/movies/usecase/trailer_movie_usecase.dart';
import 'package:movie_app/domain/tv/repo/tv_repo.dart';
import 'package:movie_app/domain/tv/usecase/search_tv_usecase.dart';
import 'package:movie_app/domain/tv/usecase/tv_popular_usecase.dart';

final sl = GetIt.instance;
void initDep() {
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<MovieSource>(MovieSourceImpl());
  sl.registerSingleton<MovieRepo>(MovireRepoImpl());
  sl.registerSingleton<MoviesUsecase>(MoviesUsecase());
  sl.registerSingleton<NowPlayingUsecase>(NowPlayingUsecase());
  sl.registerSingleton<TvSource>(TvSourceImpl());
  sl.registerSingleton<TvRepo>(TvRepoImpl());
  sl.registerSingleton<TvPopularUsecase>(TvPopularUsecase());
  sl.registerSingleton<TrailerMovieUsecase>(TrailerMovieUsecase());
  sl.registerSingleton<RecommendationsUsecase>(RecommendationsUsecase());
  sl.registerSingleton<SearchMovieUsecase>(SearchMovieUsecase());
  sl.registerSingleton<SearchTvUsecase>(SearchTvUsecase());
}
