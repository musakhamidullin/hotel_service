part of 'login_form_cubit.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @Default('') String email,
    @Default('')  String password,
}) = _Initial;

  const LoginFormState._();

  factory LoginFormState.fromJson(Map<String, dynamic> json) =>
      _$LoginFormStateFromJson(json);
}
