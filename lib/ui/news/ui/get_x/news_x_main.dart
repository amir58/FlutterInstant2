import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:instant2/generated/l10n.dart';
import 'package:instant2/shared.dart';
import 'package:instant2/ui/news/model/news_response.dart';
import 'package:instant2/ui/news/ui/get_x/news_controller.dart';
import 'package:instant2/ui/news/ui/news_details_screen.dart';
import 'package:instant2/ui/news/ui/news_screen.dart';
import 'package:instant2/ui/news/ui/news_settings.dart';

class NewMainXScreen extends StatefulWidget {
  const NewMainXScreen({super.key});

  @override
  State<NewMainXScreen> createState() => _NewMainXScreenState();
}

class _NewMainXScreenState extends State<NewMainXScreen> {
  int currentIndex = 0;

  final translatedTitles = [
    S().business,
    S().sport,
    S().health,
    S().science,
    S().technology,
  ];

  final titles = [
    'Business',
    'Sports',
    'Health',
    'Science',
    'Technology',
  ];

  final screens = [
    const NewsScreen(category: 'business'),
    const NewsScreen(category: 'sports'),
    const NewsScreen(category: 'health'),
    const NewsScreen(category: 'science'),
    const NewsScreen(category: 'technology'),
  ];

  final controller = NewsController();

  @override
  void initState() {
    super.initState();
    if (PreferenceUtils.getString(PrefKeys.newsCountry).isEmpty) {
      PreferenceUtils.setString(PrefKeys.newsCountry, 'us');
    }
    controller.getNewsByCategory(titles[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translatedTitles[currentIndex]),
        actions: [
          IconButton(
            onPressed: () => navToSettingsScreen(),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
            controller.getNewsByCategory(titles[currentIndex]);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.business),
            label: translatedTitles[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.sports_baseball),
            label: translatedTitles[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.healing),
            label: translatedTitles[2],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.science),
            label: translatedTitles[3],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.biotech),
            label: translatedTitles[4],
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.articles.length,
          itemBuilder: (context, index) {
            Articles article = controller.articles[index];

            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailsScreen(
                    article: article,
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    article.urlToImage.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Hero(
                              tag: article.urlToImage,
                              child: CachedNetworkImage(
                                imageUrl: article.urlToImage,
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Text(article.title),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void navToSettingsScreen() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const NewsSettingsScreen(),
    //   ),
    // ).then((value) => cubit.getNewsByCategory(titles[currentIndex]));

    // Navigator.pushNamed(
    //   context,
    //   '/news_settings',
    // ).then((value) => cubit.getNewsByCategory(titles[currentIndex]));

    // context.go(NewsSettingsScreen.routeName);
    context
        .push(NewsSettingsScreen.routeName)
        .then((value) => controller.getNewsByCategory(titles[currentIndex]));
  }
}
