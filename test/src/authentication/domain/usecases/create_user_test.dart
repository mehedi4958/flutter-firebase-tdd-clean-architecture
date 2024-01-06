// What does the class depend on?
// Answer -> Authenticator Repository
// How can we create a fake version of the dependency?
// Answer -> Use MockTail or Mockito
// How do we control what our dependencies do?
// Answer -> Using the Mocktail's APIs

import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_firebase_tdd_clean_architecture/src/authentication/domain/usecases/create_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {
  void main() {
    late CreateUser usecase;
    late AuthenticationRepository repository;

    setUp(() {
      repository = MockAuthenticationRepository();
      usecase = CreateUser(repository);
    });

    const params = CreateUserParams.empty();

    test(
      'should call [AuthenticationRepository.createUser]',
      () async {
        /// Arrange
        // STUB
        when(
          () => repository.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar'),
          ),
        ).thenAnswer((_) async => const Right(null));

        /// Act
        usecase(params);

        /// Assert
      },
    );
  }
}
