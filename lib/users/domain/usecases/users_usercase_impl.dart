import 'package:dartz/dartz.dart';
import 'package:teste_novo_mercado/users/domain/entities/users_entity.dart';
import 'package:teste_novo_mercado/users/domain/repositories/users_repository.dart';
import 'package:teste_novo_mercado/users/domain/usecases/users_usercase.dart';

class UsersUsecaseImpl implements UsersUsercase{
  final UsersRepository _usersRepository;
  UsersUsecaseImpl(this._usersRepository);

  @override
  Future<Either<Exception, UsersEntity?>> call() async {
    return _usersRepository();
  }

}