import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/movies/repo/movie_repo.dart';
import 'package:movie_app/service_locator.dart';

class NowPlayingUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepo>().getNowPlayingMovies();
  }
}
