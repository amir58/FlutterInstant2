import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class JsonPostsScreen extends StatefulWidget {
  const JsonPostsScreen({super.key});

  @override
  State<JsonPostsScreen> createState() => _JsonPostsScreenState();
}

class _JsonPostsScreenState extends State<JsonPostsScreen> {
  List<dynamic> posts = [];

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
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Text("${index + 1} => ${posts[index]['title']}"),
          );
        },
      ),
    );
  }

  Future<void> getPosts() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');

    posts = response.data as List<dynamic>;

    setState(() {});
  }
}
