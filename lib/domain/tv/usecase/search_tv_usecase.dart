import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/repo/tv_repo.dart';
import 'package:movie_app/service_locator.dart';

class SearchTvUsecase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<TvRepo>().searchTv(params!);
  }
}
