import 'package:calculator_app/config/history_preferences.dart';
import 'package:calculator_app/model/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HistoryPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClaculatorModel(),
      child: MaterialApp(
        title: 'Calculator App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
          textTheme: const TextTheme(
            subtitle1: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
