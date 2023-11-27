import '../../../app/dio_client.dart';
import '../model/user.dart';
import 'i_auth_rep.dart';

class AuthRep implements IAuthRep {
  User? _user;

  User get user => _user!;

  @override
  Future<void> login({required String name, required String password}) async {
    final result = await DioClient().post<Map<String, dynamic>>(
      path: 'MobileAuth/Login',
      data: {
        "Login": name,
        "Password": password,
      },
    );

    _user = User.fromJson(result.data);
  }

  @override
  void logout() => _user = null;
}
