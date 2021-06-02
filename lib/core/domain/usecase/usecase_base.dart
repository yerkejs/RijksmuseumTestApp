import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yerke_test_app/core/api/exceptions.dart';

/// Base of the all usecases 
abstract class BaseUseCase<Type, Params> {
  Future<Either<AppExceptions, Type>> call(Params params);
}

/// No need to return output entity 
abstract class VoidUseCase<Params> {
  Future<void> call(Params params);
}

abstract class SuccessOnlyUseCase <Type, Params> {
  Future<Type> call(Params params);
}

/// Default entity 
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}