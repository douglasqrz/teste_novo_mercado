import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_novo_mercado/users/data/datasource/users_datasource.dart';
import 'package:teste_novo_mercado/users/data/datasource/users_datasource_impl.dart';
import 'package:teste_novo_mercado/users/domain/repositories/users_repository.dart';
import 'package:teste_novo_mercado/users/domain/repositories/users_repository_impl.dart';
import 'package:teste_novo_mercado/users/domain/usecases/users_usercase.dart';
import 'package:teste_novo_mercado/users/domain/usecases/users_usercase_impl.dart';
import 'package:teste_novo_mercado/users/presentation/controllers/users_controller.dart';

setup() {
  GetIt.I.registerLazySingleton<UsersDatasource>(() => UsersDatasourceImpl());
  GetIt.I.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(GetIt.I.get()),
  );
  GetIt.I.registerLazySingleton<UsersUsercase>(
    () => UsersUsecaseImpl(GetIt.I.get()),
  );
  GetIt.I.registerLazySingleton(() => UsersController(GetIt.I.get()));
}

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'O Novo Mercado',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Personagens'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = GetIt.I.get<UsersController>();

  @override
  void initState() {
    _controller.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (context) {
          return Stack(
            children: [
              if (!_controller.loading)
                SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder (
                      itemCount: _controller.users?.results?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: (index == _controller.users!.results!.length - 1)
                              ? EdgeInsets.fromLTRB(8, 8, 8, 88)
                              :EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network (
                                '${_controller.users?.results?.elementAt(index).image}',
                                fit: BoxFit.fitWidth,
                                width: 112,
                                height: 96,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  '${_controller.users?.results?.elementAt(index).name}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (_controller.loading)
                  Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xff000000),
                      ),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}
