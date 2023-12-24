import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'login_form_state.dart';

part 'login_form_cubit.freezed.dart';

part 'login_form_cubit.g.dart';

// todo add secure storage
class LoginFormCubit extends Cubit<LoginFormState>
    with HydratedMixin<LoginFormState> {
  LoginFormCubit() : super(const LoginFormState()) {
    hydrate();
  }

  void emailChanged(String value) => emit(state.copyWith(email: value));

  void passwordChanged(String value) => emit(state.copyWith(password: value));

  @override
  LoginFormState? fromJson(Map<String, dynamic> json) {
    return LoginFormState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(LoginFormState state) {
    return state.toJson();
  }
}
