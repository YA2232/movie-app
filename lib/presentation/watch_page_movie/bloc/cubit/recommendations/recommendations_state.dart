part of 'recommendations_cubit.dart';

@immutable
sealed class RecommendationsState {}

final class RecommendationsInitial extends RecommendationsState {}

final class RecommendationsLoading extends RecommendationsInitial {}

final class RecommendationsLoaded extends RecommendationsInitial {
  final List<MovieEntity> recommendations;

  RecommendationsLoaded(this.recommendations);
}

final class RecommendationsError extends RecommendationsInitial {
  final String errorMessage;

  RecommendationsError(this.errorMessage);
}
