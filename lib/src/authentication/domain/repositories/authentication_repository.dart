import 'package:flutter_firebase_tdd_clean_architecture/src/authentication/domain/entites/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  Future<(Exception, void)> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<(Exception, List<User>)> getUsers();
}
