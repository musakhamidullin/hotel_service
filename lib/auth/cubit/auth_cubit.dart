import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/repositories/i_auth_rep.dart';
import '../data/repositories/i_user_rep.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRep,
    required this.userRep,
  }) : super(const AuthState());

  final IAuthRep authRep;
  final IUserRep userRep;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(authStatus: AuthStatus.loading));

      // todo уточнить получение пользователя
      await authRep.signIn(email: email, password: password);

      emit(state.copyWith(authStatus: AuthStatus.authenticated));
    } catch (_) {
      emit(state.copyWith(authStatus: AuthStatus.failure));
    }
  }
}
