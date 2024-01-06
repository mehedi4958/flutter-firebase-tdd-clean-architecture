import 'package:flutter_firebase_tdd_clean_architecture/core/utils/typedef.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutPrams<Type> {
  const UseCaseWithoutPrams();
  ResultFuture<Type> call();
}
