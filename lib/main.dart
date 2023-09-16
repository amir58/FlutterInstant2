import 'package:flutter/material.dart';
import 'package:instant2/ui/home_screen.dart';
import 'package:instant2/ui/bmi/bmi_screen.dart';
import 'package:instant2/ui/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class ExpandScreen extends StatelessWidget {
  const ExpandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Total => 6
          Expanded(
            // 3/6
            flex: 3,
            child: Container(
              height: 100,
              color: Colors.black,
            ),
          ),
          Expanded(
            // 1/6
            child: Container(
              height: 100,
              color: Colors.blue,
            ),
          ),
          Expanded(
            // 1/6
            flex: 1,
            child: Row(
              children: [
                // Total => 4
                Expanded(
                  // 1/4
                  child: Container(
                    width: 100,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  // 2/4
                  flex: 2,
                  child: Container(
                    width: 100,
                    color: Colors.blueGrey,
                  ),
                ),
                Expanded(
                  // 1/4
                  child: Container(
                    width: 100,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // 1/6
            child: Container(
              height: 100,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool obscureText = true;


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
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
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
              ),const SizedBox(height: 15),
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
                      obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
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
}
