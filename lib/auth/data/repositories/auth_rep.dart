import '../model/user.dart';
import 'i_auth_rep.dart';

class AuthRep implements IAuthRep {
  User? _user;

  User get user => _user!;

  @override
  Future<void> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    //todo user null check
    _user = User(
      id: 1,
      ownerId: 181,
    );
  }
}
