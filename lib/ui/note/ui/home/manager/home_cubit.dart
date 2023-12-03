import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instant2/ui/note/database/note_database.dart';
import 'package:instant2/ui/note/model/note.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Note> myNotes = [];
  final firestore = FirebaseFirestore.instance;

  void checkInternetConnection() async {
    bool hasConnection = await InternetConnectionChecker().hasConnection;
    if (hasConnection) {
      print('hasConnection');
      getNotesFromFirestore();
    } else {
      print('Offline');
      getNotesFromLocalStorage();
    }
  }

  void getNotesFromLocalStorage() async {
    myNotes = await NoteDatabase.getNotes();
    emit(GetNotesSuccessState());
    // setState(() {});
  }

  void getNotesFromFirestore() {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    firestore
        .collection("notes")
        .where('userId', isEqualTo: userId)
        .get()
        .then((value) {
      myNotes.clear();
      for (var document in value.docs) {
        final note = Note.fromMap(document.data());
        myNotes.add(note);
      }
      emit(GetNotesSuccessState());
      // setState(() {});
    }).catchError((error) {
      print(error);
      emit(GetNotesFailureState(error.toString()));
    });
  }

  void deleteNote({
    required int index,
  }) {
    firestore.collection("notes")
        .doc(myNotes[index].id)
        .delete();

    NoteDatabase.deleteNote(myNotes[index].id);

    myNotes.removeAt(index);

    emit(DeleteNoteSuccessState());
    // setState(() {});
  }

  void addNote({required Note note}){
    myNotes.add(note);
    emit(AddNoteSuccessState());
    // setState(() {}); // TODO
  }

  updateCurrentNote(int index, Note note) {
    myNotes[index] = note;
    emit(UpdateNoteSuccessState());
    // setState(() {}); // TODO
  }

}
