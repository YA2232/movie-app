part of 'trailer_movie_cubit.dart';

@immutable
sealed class TrailerMovieState {}

final class TrailerMovieInitial extends TrailerMovieState {}

final class TrailerMovieLoading extends TrailerMovieState {}

final class TrailerMovieLoaded extends TrailerMovieState {
  final YoutubePlayerController youtubePlayerController;

  TrailerMovieLoaded(this.youtubePlayerController);
}

final class TrailerMovierError extends TrailerMovieState {
  final String errorMessage;

  TrailerMovierError(this.errorMessage);
}
