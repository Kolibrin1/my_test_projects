import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'text_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc with_Streams',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc with Streams'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => TextBloc(),
          child: const HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextBloc _bloc = BlocProvider.of<TextBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: BlocBuilder<TextBloc, String>(builder: (context, currentText) {
          return Column(
            children: [
              Text(currentText),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        _bloc.add(YesEvent());
                      },
                      child: const Text('yes')),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        _bloc.add(NoEvent());
                      },
                      child: const Text('no')),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
