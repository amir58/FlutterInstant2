import 'package:instant2/ui/news/ui/news_main.dart';
import 'package:instant2/ui/news/ui/news_settings.dart';

final routes = {
  '/': (context) => const NewMainScreen(),
  '/news_settings': (context) {
    return const NewsSettingsScreen();
  },
};
