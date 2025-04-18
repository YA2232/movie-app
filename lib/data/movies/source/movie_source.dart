import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_url.dart';
import 'package:movie_app/core/network/dio_clinte.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieSource {
  Future<Either> getPopularMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getTrailerMovie(int movieId);
  Future<Either> getRecomdationMovies(int movieId);
  Future<Either> searchMovie(String query);
}

class MovieSourceImpl extends MovieSource {
  @override
  Future<Either> getPopularMovies() async {
    try {
      var response = await sl<DioClient>()
          .get(ApiUrl.topMovies, queryParameters: {'api_key': ApiUrl.apikey});
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data["status_message"]);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>()
          .get(ApiUrl.nowPlaying, queryParameters: {'api_key': ApiUrl.apikey});
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data["status_message"]);
    }
  }

  @override
  Future<Either> getTrailerMovie(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
          ApiUrl.movie + "${movieId}/videos",
          queryParameters: {'api_key': ApiUrl.apikey});
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data["status_message"]);
    }
  }

  @override
  Future<Either> getRecomdationMovies(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
          ApiUrl.movie + "${movieId}/recommendations",
          queryParameters: {'api_key': ApiUrl.apikey});
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data["status_message"]);
    }
  }

  @override
  Future<Either> searchMovie(String query) async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.searchMovie,
          queryParameters: {'api_key': ApiUrl.apikey, 'query': query});
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data["status_message"]);
    }
  }
}
