import 'package:dartz/dartz.dart';

abstract class MovieRepo {
  Future<Either> getPopularMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getTrailerMovie(int movieId);
  Future<Either> getRecomdationMovies(int movieId);
  Future<Either> searchMovie(String query);
}
