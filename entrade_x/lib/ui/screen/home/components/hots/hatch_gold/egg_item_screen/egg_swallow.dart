import 'package:flutter/material.dart';

import '../../../../../../components/circle_k.dart';

class EggSwallowScreen extends StatelessWidget {
  const EggSwallowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Chọn gói giao dịch'),
        actions: [
          buildCircleK(
              width: 30,
              padding: const EdgeInsets.all(0),
              height: 30,
              border: Border.all(color: Colors.red, strokeAlign: 1, width: 2),
              demo: const Center(
                  child: Icon(
                Icons.question_mark_sharp,
                size: 16,
                color: Colors.red,
              )),
              color: const Color(0xff222222),
              onClicked: () {}),
          const SizedBox(
            width: 10,
          )
        ],
        backgroundColor: const Color(0xff222222),
        elevation: 0,
      ),
      
    );
  }
}