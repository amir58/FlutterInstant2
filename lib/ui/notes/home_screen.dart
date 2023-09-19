import 'package:flutter/material.dart';
import 'package:instant2/ui/notes/add_note_screen.dart';
import 'package:instant2/ui/notes/edit_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> notes = [
    '1 ONE',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNoteScreen(),
        child: Icon(Icons.add),
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
                    onPressed: () => editNote(index),
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

  void addNoteScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNoteScreen(),
      ),
    ).then((value) => addNewNote(value));
  }

  void addNewNote(value) {
    notes.add(value);
    setState(() {});
  }

  void editNote(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNoteScreen(
          title: notes[index],
        ),
      ),
    ).then((value)
    => updateNote(index, value));
  }

  void updateNote(int index, String value) {
    notes[index] = value;
    setState(() {});
  }

}
