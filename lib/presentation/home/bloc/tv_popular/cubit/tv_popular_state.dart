part of 'tv_popular_cubit.dart';

@immutable
sealed class TvPopularState {}

final class TvPopularInitial extends TvPopularState {}

final class TvPopularLoading extends TvPopularState {}

final class TvPopularLoaded extends TvPopularState {
  final List<TvEntity> popularTv;

  TvPopularLoaded(this.popularTv);
}

final class TvPopularError extends TvPopularState {
  final String errorMessage;

  TvPopularError(this.errorMessage);
}
