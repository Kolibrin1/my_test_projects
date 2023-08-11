import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_users_list_app/bloc/user_bloc.dart';

import '../bloc/user_state.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return Container(
            color: const Color.fromARGB(255, 85, 85, 85),
            child: const Center(
                child: Text(
              'Нет загруженных данных. Нажмите кнопку загрузить',
              style: TextStyle(color: Colors.white),
            )));
      }
      if (state is UserLoadingState) {
        return Container(
          color: const Color.fromARGB(255, 85, 85, 85),
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
        );
      }
      if (state is UserLoadedState) {
        return Container(
          color: const Color.fromARGB(255, 85, 85, 85),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0
                    ? const Color.fromARGB(255, 58, 58, 58)
                    : const Color.fromARGB(255, 85, 85, 85),
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            state.loadedUser[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            state.loadedUser[index].username,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            state.loadedUser[index].website,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            state.loadedUser[index].phone,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
      if (state is UserErrorState) {
        return Container(
          color: const Color.fromARGB(255, 85, 85, 85),
          child: const Center(
            child: Text(
              'Ошибка загрузки пользователей',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
