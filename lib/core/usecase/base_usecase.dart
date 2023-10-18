import 'package:clean_arch_example/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T,parameters>{
  Future<Either<Failure,T>> call(parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}