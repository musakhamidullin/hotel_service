abstract interface class IAuthRep {
  Future<void> login({required String name, required String password});
}
