import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ibmi/widgets/info_card.dart';
import 'package:ibmi/utils/calculator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);
  @override
  State<BmiPage> createState() => bmiPageState();
}

class bmiPageState extends State<BmiPage> {
  double? deviceHeight, deviceWidth;
  int age = 25, weight = 160, height = 70, gender = 0;
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: deviceHeight! * 0.85,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ageSelectContainer(),
                  weightSelectContainer(),
                ],
              ),
              heightSelectContainer(),
              genderSelectContainer(),
              calculateBMIButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ageSelectContainer() {
    return InfoCardWidget(
      height: deviceHeight! * 0.20,
      width: deviceWidth! * 0.45,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Age yr',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            age.toString(),
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: AlertDialog(
                  key: const Key('ageminus'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          age--;
                        });
                      },
                      child: const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 50,
                child: AlertDialog(
                  key: const Key('ageplus'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          age++;
                        });
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget weightSelectContainer() {
    return InfoCardWidget(
      height: deviceHeight! * 0.20,
      width: deviceWidth! * 0.45,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Weight lbs',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            weight.toString(),
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: AlertDialog(
                  key: const Key('weight_minus'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          weight--;
                        });
                      },
                      child: const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 50,
                child: AlertDialog(
                  key: const Key('weight_plus'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          weight++;
                        });
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget heightSelectContainer() {
    return InfoCardWidget(
      height: deviceHeight! * 0.18,
      width: deviceWidth! * 0.90,
      child: Column(
        children: [
          const Text(
            'Height in',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            height.toString(),
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: deviceWidth! * 0.80,
            child: Slider(
                min: 0,
                max: 96,
                divisions: 96,
                value: height.toDouble(),
                onChanged: (value) {
                  setState(() {
                    height = value.toInt();
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget genderSelectContainer() {
    return InfoCardWidget(
      height: deviceHeight! * 0.11,
      width: deviceWidth! * 0.90,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Gender',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          MaterialSegmentedControl(
            children: const {
              0: Text("Male"),
              1: Text("Female"),
            },
            selectionIndex: gender,
            onSegmentChosen: (value) {
              setState(() {
                gender = value;
              });
            },
          )
          // CupertinoSlidingSegmentedControl(
          //   groupValue: gender,
          //   children: const {
          //     0: Text("Male"),
          //     1: Text("Female"),
          //   },
          //   onValueChanged: (value) {
          //     setState(() {
          //       gender = value as int;
          //     });
          //   },
          // ),
        ],
      ),
    );
  }

  Widget calculateBMIButton() {
    return SizedBox(
      height: deviceHeight! * 0.07,
      child: MaterialButton(
        onPressed: () {
          if (height > 0 && weight > 0 && age > 0) {
            double bmi = calculateBMI(height, weight);
            showResultDialog(bmi);
          }
        },
        child: const Text("Calculate BMI"),
      ),
    );
  }

  void showResultDialog(double bmi) {
    String? status;
    if (bmi < 18.5) {
      status = "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      status = "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      status = "Overweight";
    } else if (bmi >= 30) {
      status = "Obese";
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            AlertDialog(
              actions: [
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    saveResult(bmi.toString(), status!);
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        );
      },
    );
  }

  void saveResult(String bmi, String status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'bmi_date',
      DateTime.now().toString(),
    );
    await prefs.setStringList(
      'bmi_data',
      <String>[
        bmi,
        status,
      ],
    );
    print("Result Has been saved");
    developer.log("\x1B[32mBMI Result Saved!\x1B[0m");
  }
}
