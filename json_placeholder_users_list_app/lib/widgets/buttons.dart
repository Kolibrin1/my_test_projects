import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_users_list_app/bloc/user_bloc.dart';
import 'package:json_placeholder_users_list_app/bloc/user_event.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = context.read<UserBloc>();
    return Container(
      color: const Color.fromARGB(255, 85, 85, 85),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                _userBloc.add(UserLoadEvent());
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Загрузить')),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
              onPressed: () {
                _userBloc.add(UserClearEvent());
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Очистить')),
        ],
      ),
    );
  }
}
