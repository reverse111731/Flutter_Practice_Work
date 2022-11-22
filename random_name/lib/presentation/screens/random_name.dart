import 'dart:math';
import 'package:flutter/material.dart';

class RandomName extends StatefulWidget {
  final String title;
  const RandomName({Key? key, required this.title}) : super(key: key);

  @override
  _RandomNameState createState() => _RandomNameState();
}

class _RandomNameState extends State<RandomName> {
  List<String> names = [];
  TextEditingController nameController = TextEditingController();

  void addToList() {
    if (nameController.text.isNotEmpty) {
      setState(() {
        names.add(nameController.text);
      });
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Info'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text('Swipe left or right to remove entered name'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Go it'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: _showMyDialog,
              child: const Icon(Icons.info_outline),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          names.removeAt(index);
                        });
                      },
                      child: ListTile(
                        title: Text("${index + 1}. ${names[index]}"),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Add name"),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addToList();
                        nameController.clear();
                      },
                      child: const Text("Add"),
                    )
                  ],
                ),
              ],
            ),
          ),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                if (names.length == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "LIST HAS NO NAME ",
                      ),
                    ),
                  );
                } else {
                  setState(() {
                    var randomNumber = Random();
                    String name = names[randomNumber.nextInt(names.length)];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Name You got " + name,
                      ),
                    ));
                    names.remove(name);
                  });
                }
              },
              child: const Text("Get Name"),
            ),
          ),
        ],
      ),
    );
  }
}
