import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant2/ui/note/database/note_database.dart';
import 'package:instant2/ui/note/model/note.dart';
import 'package:instant2/ui/note/ui/favourites/favourites_cubit.dart';
import 'package:instant2/ui/note/ui/home/manager/home_cubit.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final firestore = FirebaseFirestore.instance;

  late HomeCubit homeCubit;
  late FavouritesCubit favouritesCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of<HomeCubit>(context);
    favouritesCubit = BlocProvider.of<FavouritesCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
        ),
        BlocListener<FavouritesCubit, FavouritesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Note"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Text('1');
                  },
                ),
                BlocBuilder<FavouritesCubit, FavouritesState>(
                  builder: (context, state) {
                    return Text('2');
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Title"),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Title required";
                    }
                    if (value.length < 5) {
                      return "Title is very small!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: contentController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Content"),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Content required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => addNote(),
                    child: const Text("Add"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addNote() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    String title = titleController.text;

    String content = contentController.text;

    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();

    final note = Note(id, title, content);

    NoteDatabase.insertNotes(note);

    firestore.collection('notes').doc(id).set(note.toMap());

    Navigator.pop(context, note);
  }
}
