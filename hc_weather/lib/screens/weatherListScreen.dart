import 'package:flutter/material.dart';
import 'package:hc_weather/screens/index.dart';
import 'package:hc_weather/services/index.dart';

class WeatherListScreen extends StatefulWidget {
  final List rlist;

  const WeatherListScreen({Key? key, required this.rlist}) : super(key: key);

  @override
  _WeatherListScreenState createState() => _WeatherListScreenState();
}

class _WeatherListScreenState extends State<WeatherListScreen> {
  Weather weather = Weather();

  List<bool>? isFavorite = [];

  @override
  void initState() {
    super.initState();
    // getListContent(widget.rlist);
    //printList();
    //print(widget.rlist);
  }

  int getListCount(int listData) {
    int listCount = listData;

    return listCount;
  }

  int getColor(dynamic temp) {
    int hexcolor = weather.getColor(temp);
    return hexcolor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WeatherForecast"),
      ),
      body: getListCount(widget.rlist.length) > 0
          ? ListView.builder(
              itemCount: getListCount(widget.rlist.length),
              itemBuilder: (context, index) {
                isFavorite?.add(false);
                return Card(
                  margin: const EdgeInsets.all(10),
                  color: Color(getColor(widget.rlist[index]['main']['temp'])),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () async {
                        bool typeName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WeatherDetailScreen(
                                id: widget.rlist[index]['id'].toString(),
                                favorite: isFavorite?[index],
                              );
                            },
                          ),
                        );
                        isFavorite?[index] = typeName;
                        if (typeName != null) {
                          setState(() {});
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${widget.rlist[index]['main']['temp']}\u2103",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                isFavorite?[index] == true
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.black,
                                      )
                                    : const SizedBox(),
                              ]),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                "${widget.rlist[index]['name']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
//height:20,
                                width: 20,
                              ),
                              Text(
                                  "${widget.rlist[index]['weather'][0]['main']}",
                                  style: const TextStyle(color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text('No items'),
            ),
    );
  }
}
