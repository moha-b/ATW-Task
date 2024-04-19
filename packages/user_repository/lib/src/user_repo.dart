import 'models/models.dart';

abstract class UserRepository {
  Future<UserModel> signIn({required String email, required String password});
  Future<UserModel> signUp({required String email, required String password});
  Future<void> setUserData({required UserModel userModel});
  Future<void> logout();
}
