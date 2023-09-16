import 'package:flutter/material.dart';
import 'package:instant2/ui/bmi/colors.dart';

class BmiResultScreen extends StatelessWidget {

  final int result;

  const BmiResultScreen({super.key, required this.result});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: secondColor, borderRadius: BorderRadius.circular(15)),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "NORMAL",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      result.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text(
                      "You have a normal body weight.\nGood job!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: pinkColor),
                child: const Text(
                  "RE-CALCULATE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
