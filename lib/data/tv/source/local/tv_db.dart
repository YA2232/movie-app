import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/database/database_helper.dart';
import 'package:movie_app/common/helper/mapper/tv_mapper.dart';
import 'package:movie_app/data/tv/model/tv_model.dart';
import 'package:movie_app/domain/tv/entity/tv_entity.dart';
import 'package:movie_app/service_locator.dart';

abstract class TvDb {
  Future<Either> getPopularTvDb();
  Future<Either> setPopularTvDb(Map<String, dynamic> data);
}

class TvDbImpl implements TvDb {
  @override
  Future<Either> getPopularTvDb() async {
    try {
      var result = await sl<DatabaseHelper>().get(table: "popular_tv");
      List<TvEntity> tv = result
          .map((item) => TvMapper.toEntity(TvModel.fromJson(item)))
          .toList();
      return Right(tv);
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

  @override
  Future<Either> setPopularTvDb(Map<String, dynamic> data) async {
    try {
      await sl<DatabaseHelper>().insert(table: "popular_tv", data: data);
      print("the tv has been inserted ${data["title"]}");
      return Right("the tv has been inserted");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
