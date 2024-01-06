// What does the class depend on?
// Answer -> Authenticator Repository
// How can we create a fake version of the dependency?
// Answer -> Use MockTail or Mockito
// How do we control what our dependencies do?
// Answer -> Using the Mocktail's APIs

import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_tdd_clean_architecture/src/authentication/domain/entities/user.dart';
import 'package:flutter_firebase_tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_firebase_tdd_clean_architecture/src/authentication/domain/usecases/get_users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

void main() {
  late GetUsers usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthenticationRepository();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test(
    'should call [AuthenticationRepository.getUsers] and return [List<User>]',
    () async {
      /// Arrange
      // STUB
      when(() => repository.getUsers())
          .thenAnswer((_) async => const Right(tResponse));

      /// Act
      final result = await usecase();

      /// Assert
      expect(result, equals(const Right<dynamic, List<User>>(tResponse)));

      verify(() => repository.getUsers()).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
