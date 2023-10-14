import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: phoneController,
                maxLength: 11,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: 'Confirmation Password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text;
                    String password = passwordController.text;

                    createAccount(email, password);
                  },
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  child: const Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createAccount(String email, String password) async {
    // FirebaseAuth.instance.createUserWithEmailAndPassword(
    //   email: email,
    //   password: password,
    // ).then((value) {
    //   Fluttertoast.showToast(msg: "AccountCreated!");
    //   Navigator.pop(context);
    // })
    // .catchError((error){
    //   Fluttertoast.showToast(msg: error.toString());
    // });

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      onRegisterSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void onRegisterSuccess() {
    saveUserData();
    Fluttertoast.showToast(msg: "AccountCreated!");
    Navigator.pop(context);
  }

  void saveUserData() {
    final userId = auth.currentUser!.uid;

    firestore.collection('users').doc(userId).set({
      'userId': userId,
      'name' : nameController.text,
      'phone' : phoneController.text,
      'email' : emailController.text,
      'imageUrl' : '',
    });
  }
}
