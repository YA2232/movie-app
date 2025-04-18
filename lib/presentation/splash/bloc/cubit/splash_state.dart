part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class DisplaySplash extends SplashState {}

final class Authenticatd extends SplashState {}

final class UnAuthenticatd extends SplashState {}
