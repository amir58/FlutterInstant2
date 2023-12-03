import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant2/shared.dart';
import 'package:instant2/ui/note/database/note_database.dart';
import 'package:instant2/ui/note/ui/home/manager/home_cubit.dart';
import 'package:instant2/ui/note/ui/login/page/login_screen.dart';
import 'package:instant2/ui/note/add_note_screen.dart';
import 'package:instant2/ui/note/edit_note_screen.dart';
import 'package:instant2/ui/note/model/note.dart';
import 'package:instant2/ui/note/profile_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = HomeCubit();

  @override
  void initState() {
    super.initState();
    cubit.checkInternetConnection();
    isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD');
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
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
                saveLogout();
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
        body: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            return current is GetNotesSuccessState ||
                current is DeleteNoteSuccessState ||
                current is UpdateNoteSuccessState;
          },
          builder: (context, state) {
            print('HomeState => ${state.runtimeType}');
            return ListView.builder(
              itemCount: cubit.myNotes.length,
              itemBuilder: (context, index) {
                print(index);
                return buildNoteItem(index);
              },
            );
          },
        ),
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
              cubit.myNotes[index].title,
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
              cubit.myNotes[index].content,
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
                  onPressed: () => cubit.deleteNote(index: index),
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
    // FirebaseCrashlytics.instance.crash();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNoteScreen(),
      ),
    ).then((value) => cubit.getNotesFromFirestore());
  }

  // void addNewNote(Note value) {
  //   cubit.myNotes.add(value);
  //   setState(() {}); // TODO
  // }

  void editNote(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNoteScreen(
          note: cubit.myNotes[index],
        ),
      ),
    ).then((value) => cubit.updateCurrentNote(index, value));
  }

  void isLoggedIn() async {
    final loggedIn = PreferenceUtils.getBool(PrefKeys.loggedIn);
    print('LoggedIn => $loggedIn');
  }

  void saveLogout() async {
    PreferenceUtils.setBool(PrefKeys.loggedIn, false);
  }
}
