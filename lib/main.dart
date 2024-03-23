import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instant2/generated/l10n.dart';
import 'package:instant2/go_router.dart';
import 'package:instant2/named_routes.dart';
import 'package:instant2/shared.dart';
import 'package:instant2/ui/animations/lottie/lottie_screen.dart';
import 'package:instant2/ui/e/core/app_dio.dart';
import 'package:instant2/ui/e/ui/e_login_screen.dart';
import 'package:instant2/ui/insta/insta_main_screen.dart';
import 'package:instant2/ui/json/json_posts_screen.dart';
import 'package:instant2/ui/maps/map_sample.dart';
import 'package:instant2/ui/news/manager/app_manager/app_cubit.dart';
import 'package:instant2/ui/news/ui/get_x/news_x_main.dart';
import 'package:instant2/ui/news/ui/news_main.dart';
import 'package:instant2/ui/news/ui/news_screen.dart';
import 'package:instant2/ui/news/ui/news_settings.dart';
import 'package:instant2/ui/note/database/note_database.dart';
import 'package:instant2/ui/note/ui/favourites/favourites_cubit.dart';
import 'package:instant2/ui/note/ui/home/page/home_screen.dart';
import 'package:instant2/ui/bmi/bmi_screen.dart';
import 'package:instant2/ui/note/ui/login/manager/login_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavouritesCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return GetMaterialApp(
            navigatorObservers: [ChuckerFlutter.navigatorObserver],
            locale: Locale(
              PreferenceUtils.getString(PrefKeys.language, 'en'),
            ),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.green,
              appBarTheme: const AppBarTheme(
                color: Colors.white,
                titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
              ),
              textTheme: const TextTheme(
                titleSmall: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
                titleLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.blue,
                ),
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.grey,
              appBarTheme: const AppBarTheme(
                  color: Colors.black,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  )),
              textTheme: const TextTheme(
                titleSmall: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                ),
                titleLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.green,
                ),
              ),
            ),
            themeMode: PreferenceUtils.getBool(PrefKeys.darkTheme)
                ? ThemeMode.dark
                : ThemeMode.light,
            // home: const NewMainScreen(),
            home: const NewMainXScreen(),
            // home: CounterPage(),
            // home: ELoginScreen(),
            // home: FirebaseAuth.instance.currentUser == null
            //     ? const LoginScreen()
            //     : const HomeScreen(),

          );
        },
      ),
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
