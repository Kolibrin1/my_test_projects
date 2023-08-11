import 'package:calculator_app/model/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ClaculatorModel>(context);
    final list = model.getList;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              model.clearList();
            },
            icon: const Icon(Icons.delete),
            color: Colors.white,
          )
        ],
        backgroundColor: Colors.black,
        title: const Text('История'),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey[900],
        ),
        child: ListView.separated(
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[800],
                    ),
                    child: Center(
                      child: Text(
                        list[index],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  height: 0.05,
                ),
              );
            },
            itemCount: list.length),
      ),
    );
  }
}
