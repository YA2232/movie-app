part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchMovieLoaded extends SearchState {
  final List<MovieEntity> listOfMovieEntity;

  SearchMovieLoaded(this.listOfMovieEntity);
}

final class SearchTvLoaded extends SearchState {
  final List<TvEntity> listOfTvEntity;

  SearchTvLoaded(this.listOfTvEntity);
}

final class SearchError extends SearchState {
  final String errorMessage;

  SearchError(this.errorMessage);
}
