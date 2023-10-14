import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instant2/ui/note/login_screen.dart';
import 'package:instant2/ui/note/add_note_screen.dart';
import 'package:instant2/ui/note/edit_note_screen.dart';
import 'package:instant2/ui/note/model/note.dart';
import 'package:instant2/ui/note/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> myNotes = [];
  final firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  void getNotes() {
    firestore.collection("notes").get().then((value) {
      myNotes.clear();
      for (var document in value.docs) {
        final note = Note.fromMap(document.data());
        myNotes.add(note);
      }
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              // Delete current user data
              FirebaseAuth.instance.signOut();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openAddNoteScreen(),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: myNotes.length,
        itemBuilder: (context, index) {
          print(index);
          return buildNoteItem(index);
        },
      ),
    );
  }

  Widget buildNoteItem(int index) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(
              myNotes[index].title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: Text(
              myNotes[index].content,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    firestore
                        .collection("notes")
                        .doc(myNotes[index].id)
                        .delete();
                    myNotes.removeAt(index);
                    setState(() {});
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text("Delete"),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => editNote(index),
                  icon: const Icon(
                    Icons.edit,
                  ),
                  label: const Text("Edit"),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void openAddNoteScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNoteScreen(),
      ),
    ).then((value) => getNotes());
  }

  void addNewNote(Note value) {
    myNotes.add(value);
    setState(() {});
  }

  void editNote(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNoteScreen(
          note: myNotes[index],
        ),
      ),
    ).then((value) => updateCurrentNote(index, value));
  }

  updateCurrentNote(int index, Note value) {
    myNotes[index] = value;
    setState(() {});
  }
}
