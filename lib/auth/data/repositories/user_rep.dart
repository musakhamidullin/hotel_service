import '../model/user.dart';
import 'i_user_rep.dart';

class UserRep implements IUserRep {
  @override
  Future<User> fetchUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return User(name: 'User');
  }
}
