import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_users_list_app/bloc/user_bloc.dart';
import 'package:json_placeholder_users_list_app/cubit/internet_cubit.dart';
import 'package:json_placeholder_users_list_app/services/user_repository.dart';
import 'package:json_placeholder_users_list_app/widgets/user_info.dart';

import '../widgets/buttons.dart';

class HomePage extends StatelessWidget {
  final userRepository = UserRepository();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepository: userRepository),
        ),
        BlocProvider(create: (context) => ConnectionCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 58, 58, 58),
          title: BlocBuilder<ConnectionCubit, MyConnectionState>(
              builder: ((context, state) => state.connected
                  ? const Text('Список пользоватлей (в сети)')
                  : const Text('Не в сети!'))),
          centerTitle: true,
        ),
        body: const Center(
          child: Column(
            children: [
              Buttons(),
              Expanded(child: UserInfo()),
            ],
          ),
        ),
      ),
    );
  }
}
