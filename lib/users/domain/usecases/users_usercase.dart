import 'package:dartz/dartz.dart';
import '../entities/users_entity.dart';

abstract class UsersUsercase {
  Future<Either<Exception, UsersEntity?>>call();
}