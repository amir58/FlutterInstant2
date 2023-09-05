import 'package:flutter/material.dart';
import 'package:instant2/main.dart';
import 'package:instant2/ui/home_screen.dart';

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

  // Layouts => Column, Row, Stack
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                      obscureText ? Icons.visibility_off : Icons.visibility),
                ),
              ),
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
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
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
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text("Register"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email == "amir@gmail.com" && password == "123123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      print('Email or password wrong!');
    }
  }
}
