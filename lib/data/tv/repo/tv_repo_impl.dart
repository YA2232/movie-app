import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/tv_mapper.dart';
import 'package:movie_app/data/tv/model/tv_model.dart';
import 'package:movie_app/data/tv/source/tv_source.dart';
import 'package:movie_app/domain/tv/entity/tv_entity.dart';
import 'package:movie_app/domain/tv/repo/tv_repo.dart';
import 'package:movie_app/service_locator.dart';

class TvRepoImpl extends TvRepo {
  @override
  Future<Either> getTvPopular() async {
    try {
      var response = await sl<TvSource>().getTvPopular();
      return response.fold((error) {
        return Left(error);
      }, (data) {
        final tv = data['results'] as List;
        print(tv);
        List<TvEntity> popularTv = tv
            .map((data) => TvMapper.toEntity(TvModel.fromJson(data)))
            .toList();
        return Right(popularTv);
      });
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> searchTv(String query) async {
    try {
      var response = await sl<TvSource>().searchTv(query);
      return response.fold((error) {
        return Left(error);
      }, (data) {
        final tv = data['results'] as List;
        print(tv);
        List<TvEntity> popularTv = tv
            .map((data) => TvMapper.toEntity(TvModel.fromJson(data)))
            .toList();
        return Right(popularTv);
      });
    } catch (e) {
      return Left(e);
    }
  }
}
