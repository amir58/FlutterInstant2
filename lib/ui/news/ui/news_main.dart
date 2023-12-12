import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant2/shared.dart';
import 'package:instant2/ui/news/manager/news_cubit.dart';
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

  final cubit = NewsCubit();

  @override
  void initState() {
    super.initState();
    if (PreferenceUtils.getString(PrefKeys.newsCountry).isEmpty) {
      PreferenceUtils.setString(PrefKeys.newsCountry, 'us');
    }
    cubit.getNewsByCategory(titles[0]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
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
              cubit.getNewsByCategory(titles[currentIndex]);
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
        body: BlocBuilder<NewsCubit, NewsState>(
          buildWhen: (previous, current) => current is GetArticlesSuccessState,
          builder: (context, state) {
            return ListView.builder(
              itemCount: cubit.articles.length,
              itemBuilder: (context, index) {
                Articles article = cubit.articles[index];

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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Text(article.title),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void navToSettingsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NewsSettingsScreen(),
      ),
    ).then((value) => cubit.getNewsByCategory(titles[currentIndex]));
  }
}
