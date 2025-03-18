import 'package:dartz/dartz.dart';
import 'package:teste_novo_mercado/users/data/datasource/users_datasource.dart';
import 'package:teste_novo_mercado/users/domain/entities/users_entity.dart';
import 'package:teste_novo_mercado/users/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository{
  final UsersDatasource _usersDatasource;

  UsersRepositoryImpl(this._usersDatasource);

  @override
  Future<Either<Exception, UsersEntity?>> call() async {
    try{
      return Right(await _usersDatasource());
    } catch(e) {
      return Left(e as Exception);
    }
  }

}