import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instant2/shared.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({
    required String email,
    required String password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(LoginSuccessState());
      saveLoggedIn();
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        if (error.code == 'user-not-found') {
          emit(LoginFailureState('No user found for that email.'));
          // displayToast('No user found for that email.');
        } else if (error.code == 'wrong-password') {
          emit(LoginFailureState('Wrong password provided for that user.'));
          // displayToast('Wrong password provided for that user.');
        }
      }
      emit(LoginFailureState(error.toString()));
      // Fluttertoast.showToast(msg: error.toString());
    });

    // if (email == "amir@gmail.com" && password == "123123") {
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const HomeScreen(),
    //     ),
    //     (route) => false,
    //   );
    // } else {
    //   print('Email or password wrong!');
    //   displaySnackBar('Email or password wrong!');
    //   displayToast("Email or password wrong!");
    // }
  }

  void saveLoggedIn() async {
    PreferenceUtils.setBool(PrefKeys.loggedIn, true);
  }
}
