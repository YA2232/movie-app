import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/movies/repo/movie_repo.dart';
import 'package:movie_app/service_locator.dart';

class RecommendationsUsecase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepo>().getRecomdationMovies(params!);
  }
}
