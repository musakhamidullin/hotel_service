abstract interface class IAuthRep {
  Future<void> login({required String email, required String password});
}
