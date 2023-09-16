import 'package:flutter/material.dart';
import 'package:instant2/ui/bmi/bmi_result_screen.dart';
import 'package:instant2/ui/bmi/colors.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool male = true;

  double height = 170;

  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("BMI Calculator".toUpperCase()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        male = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: male ? selectedColor : secondColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                            size: 80,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        male = false;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: male ? secondColor : selectedColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            color: Colors.white,
                            size: 80,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: secondColor, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height".toUpperCase(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${height.toInt()}cm",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Slider(
                    min: 50,
                    max: 225,
                    activeColor: pinkColor,
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: secondColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight".toUpperCase(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                if (weight == 1) {
                                  return;
                                }
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Colors.grey,
                              mini: true,
                              child: const Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Colors.grey,
                              mini: true,
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: secondColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age".toUpperCase(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 33,
                              fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                if (age == 1) {
                                  return;
                                }
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Colors.grey,
                              mini: true,
                              child: const Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Colors.grey,
                              mini: true,
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                double result = height * weight / age;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  BmiResultScreen(
                      result: result.toInt(),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: pinkColor),
              child: const Text(
                "CALCULATE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
