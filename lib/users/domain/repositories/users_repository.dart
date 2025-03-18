import 'package:dartz/dartz.dart';
import 'package:teste_novo_mercado/users/domain/entities/users_entity.dart';

abstract class UsersRepository{
  Future<Either<Exception, UsersEntity?>> call();
}