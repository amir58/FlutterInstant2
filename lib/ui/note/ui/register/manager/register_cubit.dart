import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant2/ui/note/ui/register/manager/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  void createAccount(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(RegisterSuccessState());
      // onRegisterSuccess(); // TODO
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        emit(RegisterFailureState('The password provided is too weak.'));
        // Fluttertoast.showToast(msg: 'The password provided is too weak.'); // TODO
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        emit(
            RegisterFailureState('The account already exists for that email.'));
        // Fluttertoast.showToast(
        //     msg: 'The account already exists for that email.'); // TODO
      }
    } catch (e) {
      print(e);
      emit(RegisterFailureState(e.toString()));
      // Fluttertoast.showToast(msg: e.toString()); // TODO
    }
  }

  void saveUserData({
    required String name,
    required String phone,
    required String email,
  }) {
    final userId = auth.currentUser!.uid;

    firestore.collection('users').doc(userId).set({
      'userId': userId,
      'name': name,
      'phone': phone,
      'email': email,
      'imageUrl': '',
    });
  }
}
