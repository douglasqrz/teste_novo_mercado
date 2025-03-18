import 'package:mobx/mobx.dart';
import 'package:teste_novo_mercado/users/domain/entities/users_entity.dart';
import 'package:teste_novo_mercado/users/domain/usecases/users_usercase.dart';

part 'users_controller.g.dart';

class UsersController = UsersControllerBase with _$UsersController;

abstract class UsersControllerBase with Store{

  final UsersUsercase _usersUsercase;

  UsersControllerBase(this._usersUsercase);

  @observable
  bool loading = false;

  @observable
  UsersEntity? users;

  Future<void> getUsers() async {
    loading = true;
    final response = await _usersUsercase();
    await response.fold((l){
      print('Error');
    }, (r) async {
      if (r != null) {
        users = r;
        print(users);
      }
    });
    loading = false;
  }
}