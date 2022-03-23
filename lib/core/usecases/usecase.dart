// ignore_for_file: body_might_complete_normally_nullable

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

//? General Application UseCases
class UseCase<Type, Params> {
  Future<Either<Failure, Type>>? call(Params params) {}
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
