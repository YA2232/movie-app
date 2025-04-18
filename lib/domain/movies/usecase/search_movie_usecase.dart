import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/movies/repo/movie_repo.dart';
import 'package:movie_app/service_locator.dart';

class SearchMovieUsecase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<MovieRepo>().searchMovie(params!);
  }
}
