import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  static const baseUrl = "https://api.themoviedb.org/3/";
  static const popularMovies = "movie/popular";
  static const topMovies = "movie/top_rated";
  static const nowPlaying = "movie/now_playing";
  static const popularTv = "tv/popular";
  static const movie = "movie/";
  static const youtube = "https://www.youtube.com/watch?v=";
  static const searchMovie = "search/movie";
  static const searchTv = "search/tv";
  static final apikey = dotenv.env['API_KEY'];

  // static const baseUrl =
  //     "https://netflex-backend-production-8413.up.railway.app/";
  // static const signup = "api/v1/auth/signup";
  // static const signin = "api/v1/auth/signin";
}
