import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TextEvent {}

class YesEvent extends TextEvent {}

class NoEvent extends TextEvent {}

class TextBloc extends Bloc<TextEvent, String> {
  TextBloc() : super('yes') {
    on<YesEvent>(
      (event, emit) => emit('yes'),
    );
    on<NoEvent>(
      (event, emit) => emit('no'),
    );
  }
}
