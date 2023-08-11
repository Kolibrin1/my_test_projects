import 'package:calculator_app/model/calculator_model.dart';
import 'package:calculator_app/pages/history_page.dart';
import 'package:calculator_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ClaculatorModel>(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            MyTextButton(
                Colors.grey, Colors.grey[900], model.del, 'C', Colors.blue),
            Container(
              color: Colors.grey[900],
              width: 0.05,
              height: 100.8,
            ),
            MyTextButton(
                Colors.grey, Colors.grey[900], model.div, '/', Colors.blue),
            MyTextButton(
                Colors.grey, Colors.grey[900], model.comp, 'x', Colors.blue),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.grey[900],
                    shape: const LinearBorder()),
                onPressed: () {
                  model.remove();
                },
                child: Container(
                    height: 85,
                    child: Center(
                      child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: const Icon(
                            Icons.redo,
                            size: 36,
                            color: Colors.blue,
                          )),
                    )),
              ),
            ),
          ],
        ),
        Row(
          children: [
            MyTextButton(
                Colors.grey, Colors.black, model.seven, '7', Colors.white),
            Container(
              color: Colors.grey[900],
              width: 0.05,
              height: 100.8,
            ),
            MyTextButton(
                Colors.grey, Colors.black, model.eight, '8', Colors.white),
            MyTextButton(
                Colors.grey, Colors.black, model.nine, '9', Colors.white),
            MyTextButton(
                Colors.grey, Colors.grey[900], model.sub, '-', Colors.blue),
          ],
        ),
        Row(
          children: [
            MyTextButton(
                Colors.grey, Colors.black, model.four, '4', Colors.white),
            Container(
              color: Colors.grey[900],
              width: 0.05,
              height: 100.8,
            ),
            MyTextButton(
                Colors.grey, Colors.black, model.five, '5', Colors.white),
            MyTextButton(
                Colors.grey, Colors.black, model.six, '6', Colors.white),
            MyTextButton(
                Colors.grey, Colors.grey[900], model.plus, '+', Colors.blue),
          ],
        ),
        Container(
          height: 0.05,
          width: double.infinity,
        ),
        Row(
          children: [
            MyTextButton(
                Colors.grey, Colors.black, model.one, '1', Colors.white),
            Container(
              color: Colors.grey[900],
              width: 0.05,
              height: 100.8,
            ),
            MyTextButton(
                Colors.grey, Colors.black, model.two, '2', Colors.white),
            MyTextButton(
                Colors.grey, Colors.black, model.three, '3', Colors.white),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.grey[900],
                    shape: const LinearBorder()),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HistoryPage(),
                    ),
                  );
                },
                child: Container(
                  height: 85,
                  child: const Center(
                    child: Icon(
                      Icons.history,
                      size: 32,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            MyIconButton(Colors.grey, Colors.black, model.upAnswer,
                Icons.arrow_upward, Colors.white),
            Container(
              color: Colors.grey[900],
              width: 0.05,
              height: 100.8,
            ),
            MyTextButton(
                Colors.grey, Colors.black, model.zero, '0', Colors.white),
            MyTextButton(
                Colors.grey, Colors.black, model.sign, ',', Colors.white),
            MyTextButton(Colors.grey, Colors.blue[700], model.changeRes, '=',
                Colors.white),
          ],
        ),
      ],
    );
  }
}
