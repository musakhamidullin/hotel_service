part of 'auth_cubit.dart';

enum AuthStatus { unauthenticated, loading, authenticated, failure }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.unauthenticated) AuthStatus authStatus,
  }) = _Initial;

  const AuthState._();

  bool logged() => authStatus == AuthStatus.authenticated;
  bool loading() => authStatus == AuthStatus.loading;
}
