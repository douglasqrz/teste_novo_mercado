import 'package:dio/dio.dart';
import 'package:teste_novo_mercado/users/data/datasource/users_datasource.dart';

import '../../domain/entities/users_entity.dart';

class UsersDatasourceImpl implements UsersDatasource {

  @override
  Future<UsersEntity?> call () async {
    final dio = Dio();
    UsersEntity? usersEntity;

    final response = await dio.get('https://rickandmortyapi.com/api/character');

    if (response.statusCode == 200) {
      usersEntity = UsersEntity.fromJson(response.data);
      return usersEntity;
    }
    return usersEntity;
  }
}