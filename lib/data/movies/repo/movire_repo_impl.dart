import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_app/core/entity/trailer_entity.dart';
import 'package:movie_app/core/model/trailer_mdel.dart';
import 'package:movie_app/data/movies/model/movie_model.dart';
import 'package:movie_app/data/movies/source/movie_source.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_app/domain/movies/repo/movie_repo.dart';
import 'package:movie_app/service_locator.dart';

class MovireRepoImpl extends MovieRepo {
  @override
  Future<Either> getPopularMovies() async {
    try {
      var response = await sl<MovieSource>().getPopularMovies();
      return response.fold((error) {
        return Left(error);
      }, (data) {
        final movies = data['results'] as List;
        print(movies);
        List<MovieEntity> popularMovies = movies
            .map((data) => MovieMapper.toEntity(MovieModel.fromJson(data)))
            .toList();
        return Right(popularMovies);
      });
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<MovieSource>().getNowPlayingMovies();
      return response.fold((error) {
        return Left(error);
      }, (data) {
        final movies = data['results'] as List;
        print(movies);
        List<MovieEntity> popularMovies = movies
            .map((data) => MovieMapper.toEntity(MovieModel.fromJson(data)))
            .toList();
        return Right(popularMovies);
      });
    } catch (e) {
      return Left(e);
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
