import 'package:flutter_application_2/cubit/create_users/create_user_cubit.dart';
import 'package:flutter_application_2/repository/auth_repository.dart';
import 'package:flutter_application_2/screen/home_screen.dart';
import 'package:flutter_application_2/repository/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  final api = ApiService();

  final users = api.getUsers();

  print(users);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateUserCubit>(
          create: (_) => CreateUserCubit(AuthRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
