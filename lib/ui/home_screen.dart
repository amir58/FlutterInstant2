import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> notes = [
    '1 ONE',
    '2',
    '3 THREE',
    '4',
    '5 FIVE',
    '6',
    '7 SEVEN',
    '8',
    '9 NINE',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return buildNoteItem(index);
        },
      ),
    );
  }

  Widget buildNoteItem(int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              notes[index],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      notes.removeAt(index);
                      setState(() {});
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text("Delete"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
