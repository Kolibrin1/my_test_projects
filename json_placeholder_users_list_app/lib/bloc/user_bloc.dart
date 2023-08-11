import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_users_list_app/bloc/user_event.dart';
import 'package:json_placeholder_users_list_app/services/user_repository.dart';

import '../model/user.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        try {
          final List<User> loadedUserList = await userRepository.getAllUsers();
          emit(UserLoadedState(loadedUser: loadedUserList));
        } catch (_) {
          emit(UserErrorState());
        }
      },
    );
    on<UserClearEvent>(
      (event, emit) async {
        emit(UserEmptyState());
      },
    );
  }
}
