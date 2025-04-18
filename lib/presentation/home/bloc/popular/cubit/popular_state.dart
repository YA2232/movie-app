part of 'popular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoading extends PopularState {}

final class PopularLoaded extends PopularState {
  final List<MovieEntity> popular;

  PopularLoaded(this.popular);
}

final class PopularError extends PopularState {
  final String errorMessage;

  PopularError(this.errorMessage);
}
