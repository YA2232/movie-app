import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_url.dart';
import 'package:movie_app/core/network/dio_clinte.dart';
import 'package:movie_app/service_locator.dart';

abstract class TvSource {
  Future<Either> getTvPopular();
  Future<Either> searchTv(String query);
}

class TvSourceImpl extends TvSource {
  @override
  Future<Either> getTvPopular() async {
    try {
      var response = await sl<DioClient>()
          .get(ApiUrl.popularTv, queryParameters: {'api_key': ApiUrl.apikey});
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data["status_message"]);
    }
  }

  @override
  Future<Either> searchTv(String query) async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.searchTv,
          queryParameters: {'api_key': ApiUrl.apikey, 'query': query});
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data["status_message"]);
    }
  }
}
