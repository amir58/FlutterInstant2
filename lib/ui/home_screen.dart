import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          Image.network(
            "https://www.mindinventory.com/blog/wp-content/uploads/2022/10/flutter-3.png",
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/whatsapp.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 15),
              Image.asset(
                "assets/images/youtube.png",
                height: 100,
                width: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
