import 'package:calculator_app/model/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/buttons_widget.dart';
import '../widgets/window_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ClaculatorModel>(context, listen: false).init();
    return const Scaffold(
      body: Column(
        children: [
          WindowWidget(),
          ButtonsWidget(),
        ],
      ),
    );
  }
}
