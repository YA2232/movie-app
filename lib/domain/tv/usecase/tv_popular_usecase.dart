import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/repo/tv_repo.dart';
import 'package:movie_app/service_locator.dart';

class TvPopularUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TvRepo>().getTvPopular();
  }
}
