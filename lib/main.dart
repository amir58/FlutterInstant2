import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instant2/shared.dart';
import 'package:instant2/ui/e/core/app_dio.dart';
import 'package:instant2/ui/e/ui/e_login_screen.dart';
import 'package:instant2/ui/insta/insta_main_screen.dart';
import 'package:instant2/ui/json/json_posts_screen.dart';
import 'package:instant2/ui/news/ui/news_main.dart';
import 'package:instant2/ui/news/ui/news_screen.dart';
import 'package:instant2/ui/note/database/note_database.dart';
import 'package:instant2/ui/note/ui/home/page/home_screen.dart';
import 'package:instant2/ui/bmi/bmi_screen.dart';
import 'package:instant2/ui/note/ui/login/page/login_screen.dart';
import 'package:instant2/ui/state_management/counter/counter_cubit.dart';
import 'package:instant2/ui/state_management/counter/counter_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferenceUtils.init();
  await NoteDatabase.init();
  AppDio.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: CounterPage(),
      // home: ELoginScreen(),
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginScreen()
          : const HomeScreen(),
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
