import 'package:flutter_firebase_tdd_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_firebase_tdd_clean_architecture/core/utils/typedef.dart';
import 'package:flutter_firebase_tdd_clean_architecture/src/authentication/domain/entities/user.dart';
import 'package:flutter_firebase_tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UseCaseWithoutPrams<List<User>> {
  const GetUsers(this._repository);

  final AuthenticationRepository _repository;
  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
