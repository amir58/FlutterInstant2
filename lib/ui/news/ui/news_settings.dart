import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:instant2/generated/l10n.dart';
import 'package:instant2/shared.dart';
import 'package:instant2/ui/news/manager/app_manager/app_cubit.dart';
import 'package:instant2/ui/news/ui/news_select_country_screen.dart';

class NewsSettingsScreen extends StatefulWidget {
  const NewsSettingsScreen({super.key});

  static const String routeName = "/news_settings";

  @override
  State<NewsSettingsScreen> createState() => _NewsSettingsScreenState();
}

class _NewsSettingsScreenState extends State<NewsSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(S().settings),
        elevation: 0,
      ),
      body: Column(
        children: [
          settingItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewsSelectCountryScreen(),
                ),
              ).then((value) => setState(() {}));
            },
            icon: Icons.language_rounded,
            title: S().country,
            value: PreferenceUtils.getString(PrefKeys.newsCountry),
          ),
          settingItem(
            onTap: () {},
            icon: Icons.notifications,
            title: S().notifications,
          ),
          settingItem(
              onTap: () => showChangeThemeBottomSheet(),
              icon: Icons.color_lens_rounded,
              title: S().theme,
              value: PreferenceUtils.getBool(PrefKeys.darkTheme)
                  ? S().dark
                  : S().light),
          settingItem(
              onTap: () => showChangeLanguageBottomSheet(),
              icon: Icons.language_rounded,
              title: S().language,
              value: PreferenceUtils.getString(PrefKeys.language, 'en')),
        ],
      ),
    );
  }

  Widget settingItem({
    required GestureTapCallback onTap,
    required IconData icon,
    required String title,
    String value = '',
  }) {
    print('Theme => ${Theme.of(context).brightness}');
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              icon,
              // color: Colors.green,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  showChangeThemeBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text('Select Theme'),
                InkWell(
                  onTap: () async {
                    await PreferenceUtils.setBool(
                      PrefKeys.darkTheme,
                      false,
                    );
                    // Navigator.pop(context);
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    // color: Colors.grey[200],
                    child: const Text(
                      'Light',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    await PreferenceUtils.setBool(
                      PrefKeys.darkTheme,
                      true,
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    // color: Colors.grey[200],
                    child: const Text(
                      'Dark',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      BlocProvider.of<AppCubit>(context).themeChanged();
    });
  }

  showChangeLanguageBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text('Select Language'),
                InkWell(
                  onTap: () async {
                    await PreferenceUtils.setString(
                      PrefKeys.language,
                      'en',
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    // color: Colors.grey[200],
                    child: const Text(
                      'En',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    await PreferenceUtils.setString(
                      PrefKeys.language,
                      'ar',
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    // color: Colors.grey[200],
                    child: const Text(
                      'Ar',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      BlocProvider.of<AppCubit>(context).themeChanged();
    });
  }
}
