import 'package:flutter/material.dart';
import 'package:instant2/shared.dart';
import 'package:instant2/ui/news/ui/news_select_country_screen.dart';

class NewsSettingsScreen extends StatefulWidget {
  const NewsSettingsScreen({super.key});

  @override
  State<NewsSettingsScreen> createState() => _NewsSettingsScreenState();
}

class _NewsSettingsScreenState extends State<NewsSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Settings'),
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
              ).then((value) => setState((){}));
            },
            icon: Icons.language_rounded,
            title: 'Country',
            value: PreferenceUtils.getString(PrefKeys.newsCountry),
          ),
          settingItem(
            onTap: () {},
            icon: Icons.notifications,
            title: 'Notifications',
          ),
          settingItem(
              onTap: () {},
              icon: Icons.color_lens_rounded,
              title: 'Theme',
              value: 'Light'),
          settingItem(
              onTap: () {},
              icon: Icons.language_rounded,
              title: 'Language',
              value: 'en'),
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
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.green,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
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
            const Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
      ),
    );
  }
}
