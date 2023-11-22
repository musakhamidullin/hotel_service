import 'i_auth_rep.dart';

class AuthRep implements IAuthRep {

  AuthRep._();

  static final AuthRep _current = AuthRep._();

  static AuthRep get current => _current;

  String _token = '';

  String get token => _token;

  @override
  Future<void> signIn({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    _token = 'test';
  }
}