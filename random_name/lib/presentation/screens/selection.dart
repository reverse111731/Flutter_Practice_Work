import 'package:flutter/material.dart';
import 'package:random_name/presentation/screens/index.dart';

class SelectionPage extends StatelessWidget {
  final String title;

  const SelectionPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: SelectionScreenKey,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RandomName(
                      title: "Random Name",
                    ),
                  ),
                );
              },
              child: const Text(
                "Random Name",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
