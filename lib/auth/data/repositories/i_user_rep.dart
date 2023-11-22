import '../model/user.dart';

abstract interface class IUserRep {
  Future<User> fetchUser();
}