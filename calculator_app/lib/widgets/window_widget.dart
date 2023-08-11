import 'package:calculator_app/model/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WindowWidget extends StatefulWidget {
  const WindowWidget({super.key});

  @override
  State<WindowWidget> createState() => _WindowWidgetState();
}

class _WindowWidgetState extends State<WindowWidget> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ClaculatorModel>(context);
    myController.text = model.getText;
    return Expanded(
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                onTap: () => model.setPos(myController.selection.base.offset),
                controller: myController,
                style: const TextStyle(color: Colors.white, fontSize: 32),
                textAlign: TextAlign.right,
                autofocus: true,
                cursorHeight: 45,
                keyboardType: TextInputType.none,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                model.getRes,
                style: const TextStyle(color: Colors.white, fontSize: 32),
              ),
              const SizedBox(
                width: 20,
              )
            ]),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
