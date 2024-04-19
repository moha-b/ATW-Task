part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class LoadingState extends AuthState {}

final class Unauthenticated extends AuthState {}

final class Authenticated extends AuthState {}

final class AuthenticationFailed extends AuthState {}
