import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/database/database_helper.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_app/core/entity/trailer_entity.dart';
import 'package:movie_app/core/model/trailer_mdel.dart';
import 'package:movie_app/data/movies/model/movie_model.dart';
import 'package:movie_app/data/movies/source/local/movie_db.dart';
import 'package:movie_app/data/movies/source/remote/movie_source.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_app/domain/movies/repo/movie_repo.dart';
import 'package:movie_app/service_locator.dart';

class MovireRepoImpl extends MovieRepo {
  @override
  Future<Either> getPopularMovies() async {
    try {
      var response = await sl<MovieSource>().getPopularMovies();
      var localData = await sl<MovieDb>();

      return response.fold((error) {
        return Left(error);
      }, (data) async {
        final movies = data['results'] as List;
        await Future.wait(movies
            .map((item) => localData
                .setPopularMoviesDb(MovieModel.fromJson(item).toJson()))
            .toList());
        List<MovieEntity> popularMovies = movies
            .map((data) => MovieMapper.toEntity(MovieModel.fromJson(data)))
            .toList();
        return Right(popularMovies);
      });
    } catch (e) {
      try {
        var result = await sl<MovieDb>().getPopularMoviesDb();
        return result.fold((l) {
          return Left(l);
        }, (r) {
          return Right(r);
        });
      } catch (e) {
        return Left(e);
      }
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<MovieSource>().getNowPlayingMovies();
      var localData = await sl<MovieDb>();

      return response.fold((error) {
        return Left(error);
      }, (data) async {
        final movies = data['results'] as List;
        await Future.wait(movies
            .map((item) =>
                localData.setNowPlayingDb(MovieModel.fromJson(item).toJson()))
            .toList());
        List<MovieEntity> popularMovies = movies
            .map((data) => MovieMapper.toEntity(MovieModel.fromJson(data)))
            .toList();
        return Right(popularMovies);
      });
    } catch (e) {
      try {
        var result = await sl<MovieDb>().getNowPlayingDb();
        return result.fold((l) {
          return Left(l);
        }, (r) {
          return Right(r);
        });
      } catch (e) {
        return Left(e);
      }
    }
  }

  @override
  Future<Either> getTrailerMovie(int movieId) async {
    try {
      var response = await sl<MovieSource>().getTrailerMovie(movieId);
      return response.fold((error) {
        return Left(error);
      }, (data) {
        final trailer = data['results'] as List;
        print(trailer);
        List<TrailerEntity> trailerMovie = trailer
            .map((data) => TrailerMapper.toEntity(TrailerModel.fromJson(data)))
            .toList();
        return Right(trailerMovie);
      });
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getRecomdationMovies(int movieId) async {
    try {
      var response = await sl<MovieSource>().getRecomdationMovies(movieId);
      var localData = await sl<MovieDb>();

      return response.fold((error) {
        return Left(error);
      }, (data) async {
        final movies = data['results'] as List;
        await Future.wait(movies
            .map((item) => localData
                .setRecomdationMovies(MovieModel.fromJson(item).toJson()))
            .toList());
        List<MovieEntity> popularMovies = movies
            .map((data) => MovieMapper.toEntity(MovieModel.fromJson(data)))
            .toList();
        return Right(popularMovies);
      });
    } catch (e) {
      try {
        var result = await sl<MovieDb>().getRecomdationMovies(movieId);
        return result.fold((l) {
          return Left(l);
        }, (r) {
          return Right(r);
        });
      } catch (e) {
        return Left(e);
      }
    }
  }

  @override
  Future<Either> searchMovie(String query) async {
    try {
      var response = await sl<MovieSource>().searchMovie(query);
      return response.fold((error) {
        return Left(error);
      }, (data) {
        final movies = data['results'] as List;
        print(movies);
        List<MovieEntity> recomendations = movies
            .map((data) => MovieMapper.toEntity(MovieModel.fromJson(data)))
            .toList();
        return Right(recomendations);
      });
    } catch (e) {
      return Left(e);
    }
  }
}
