part of 'now_playing_cubit.dart';

@immutable
sealed class NowPlayingState {}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingLoaded extends NowPlayingState {
  final List<MovieEntity> nowPlayingList;

  NowPlayingLoaded(this.nowPlayingList);
}

final class NowPlayingError extends NowPlayingState {
  final String errorMessage;

  NowPlayingError(this.errorMessage);
}
