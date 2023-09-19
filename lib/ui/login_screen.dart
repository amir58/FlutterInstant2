import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instant2/main.dart';
import 'package:instant2/ui/notes/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

  // Define a controller
  // Bind controller with TextFormField
  // Get the value from the controller
  final emailController = TextEditingController();
  var passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Define a form key
  // Wrap Column widget by Form widget
  // bind form key variable with Form widget
  // write TextFormField validators
  // call form key variable and validate the form

  final formKey = GlobalKey<FormState>();

  // Layouts => Column, Row, Stack
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        elevation: 0,
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.ac_unit_rounded,
                size: 100,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Form(
                  key: formKey, // Binding
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    // Main  => Vertical
                    mainAxisAlignment: MainAxisAlignment.start,

                    // Cross => Horizontal
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email required!";
                          }
                          // Not contain @ OR not contain .
                          if (!value.contains("@") || !value.contains(".")) {
                            return "Invalid email!";
                          }
                          return null;
                        },
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
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password required!";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      Container(
                        alignment: AlignmentDirectional.centerEnd,
                        padding: const EdgeInsets.all(5),
                        child: const Text("Forget password ?"),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        // Main  => Horizontal
                        mainAxisAlignment: MainAxisAlignment.center,

                        // Cross => Vertical
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            // 2/3
                            child: ElevatedButton(
                              onPressed: () => login(),
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder()),
                              child: const Text("Login"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            // 1/3
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder()),
                              child: const Text("Register"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    // Not validate => return
    if (!formKey.currentState!.validate()) {
      return;
    }

    String email = emailController.text;
    String password = passwordController.text;

    if (email == "amir@gmail.com" && password == "123123") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    } else {
      print('Email or password wrong!');
      displaySnackBar('Email or password wrong!');
      displayToast("Email or password wrong!");
    }
  }

  void displayToast(String message) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void displaySnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
