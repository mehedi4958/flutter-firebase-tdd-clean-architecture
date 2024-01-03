import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_tdd_clean_architecture/core/errors/failure.dart';
import 'package:flutter_firebase_tdd_clean_architecture/src/authentication/domain/entites/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  Future<Either<Failure, void>> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<Either<Failure, List<User>>> getUsers();
}
