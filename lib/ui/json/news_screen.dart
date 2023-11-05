import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instant2/ui/json/news_response.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Articles> articles = [];

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
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
                        child: Image.network(
                          article.urlToImage,
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

  Future<void> getPosts() async {
    final response = await Dio().get(
      //    BASE URL      / END POINT
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        "country": "us",
        "category": "business",
        "apiKey": "f658f070236f414194e11fc3023c8333",
      },
    );

    final news = NewsResponse.fromJson(response.data);

    articles = news.articles;

    setState(() {});
  }
}
