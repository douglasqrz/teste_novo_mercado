import 'package:teste_novo_mercado/users/domain/entities/users_entity.dart';

abstract class UsersDatasource{
  Future<UsersEntity?>call();
}