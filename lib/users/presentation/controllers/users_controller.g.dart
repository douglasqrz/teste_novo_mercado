// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsersController on UsersControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: 'UsersControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$usersAtom =
      Atom(name: 'UsersControllerBase.users', context: context);

  @override
  UsersEntity? get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(UsersEntity? value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading},
users: ${users}
    ''';
  }
}
