import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/database/database_helper.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/data/movies/model/movie_model.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieDb {
  Future<Either> getNowPlayingDb();
  Future<Either> setNowPlayingDb(Map<String, dynamic> data);
  Future<Either> getPopularMoviesDb();
  Future<Either> setPopularMoviesDb(Map<String, dynamic> data);
  Future<Either> getRecomdationMovies(int movieId);
  Future<Either> setRecomdationMovies(Map<String, dynamic> data);
}

class MovieDbImpl implements MovieDb {
  @override
  Future<Either> getNowPlayingDb() async {
    try {
      var result = await sl<DatabaseHelper>().get(table: "now_playing");
      List<MovieEntity> movies = result
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

  @override
  Future<Either> getPopularMoviesDb() async {
    try {
      var result = await sl<DatabaseHelper>().get(table: "popular_movies");

      List<MovieEntity> movies = result
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

  @override
  Future<Either> getRecomdationMovies(int movieId) async {
    try {
      var result = await sl<DatabaseHelper>().getWhere(
          table: "recommendation", where: "id = ?", whereArgs: [movieId]);

      List<MovieEntity> movies = result
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

  @override
  Future<Either> setNowPlayingDb(Map<String, dynamic> data) async {
    try {
      await sl<DatabaseHelper>().insert(table: "now_playing", data: data);
      print("the now playing has been inserted ${data["title"]}");
      return Right("the nowPlaying has been inserted");
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> setPopularMoviesDb(Map<String, dynamic> data) async {
    try {
      await sl<DatabaseHelper>().insert(table: "popular_movies", data: data);
      print("the popular movies has been inserted ${data["title"]}");

      return Right("the popular Movies has been inserted");
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> setRecomdationMovies(Map<String, dynamic> data) async {
    try {
      await sl<DatabaseHelper>().insert(table: "recommendation", data: data);
      print("the popular movies has been inserted ${data["title"]}");
      return Right("the recommendation has been inserted");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
