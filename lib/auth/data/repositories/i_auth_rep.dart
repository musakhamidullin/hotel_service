abstract interface class IAuthRep {
  Future<void> signIn({required String email, required String password});
}
