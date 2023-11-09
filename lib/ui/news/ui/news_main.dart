import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instant2/shared.dart';
import 'package:instant2/ui/news/model/news_response.dart';
import 'package:instant2/ui/news/ui/news_screen.dart';
import 'package:instant2/ui/news/ui/news_settings.dart';

class NewMainScreen extends StatefulWidget {
  const NewMainScreen({super.key});

  @override
  State<NewMainScreen> createState() => _NewMainScreenState();
}

class _NewMainScreenState extends State<NewMainScreen> {
  int currentIndex = 0;

  List<Articles> articles = [];

  final titles = [
    'Business',
    'Sports',
    'Health',
    'Science',
    'Technology',
  ];

  final screens = [
    NewsScreen(category: 'business'),
    NewsScreen(category: 'sports'),
    NewsScreen(category: 'health'),
    NewsScreen(category: 'science'),
    NewsScreen(category: 'technology'),
  ];

  final dio = Dio();

  @override
  void initState() {
    super.initState();
    if (PreferenceUtils.getString(PrefKeys.newsCountry).isEmpty) {
      PreferenceUtils.setString(PrefKeys.newsCountry, 'us');
    }
    getNewsByCategory(titles[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
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
            getNewsByCategory(titles[currentIndex]);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_baseball),
            label: 'Sport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            label: 'Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: 'Science',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.biotech),
            label: 'Technology',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          Articles article = articles[index];

          return Container(
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
                        child: CachedNetworkImage(
                          imageUrl: article.urlToImage,
                        ),
                      ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text(article.title),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> getNewsByCategory(String category) async {
    final response = await dio.get(
      //    BASE URL      / END POINT
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        "country": PreferenceUtils.getString(PrefKeys.newsCountry),
        "category": category,
        "apiKey": "f658f070236f414194e11fc3023c8333",
      },
    );

    print(response.statusCode);
    print(response.data);

    final news = NewsResponse.fromJson(response.data);

    articles = news.articles;

    setState(() {});
  }

  void navToSettingsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NewsSettingsScreen(),
      ),
    ).then((value) => getNewsByCategory(titles[currentIndex]));
  }
}
