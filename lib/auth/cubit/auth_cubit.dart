import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/repositories/i_auth_rep.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRep,
  }) : super(const AuthState());

  final IAuthRep authRep;

  Future<void> login({
    required String name,
    required String password,
  }) async {
    try {
      emit(state.copyWith(authStatus: AuthStatus.loading));
      await authRep.login(name: name, password: password);
      emit(state.copyWith(authStatus: AuthStatus.authenticated));
    } catch (e, t) {
      print(e);
      print(t);
      emit(state.copyWith(authStatus: AuthStatus.failure));
    }
  }
}
