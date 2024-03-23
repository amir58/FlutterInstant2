import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:instant2/shared.dart';
import 'package:instant2/ui/news/model/news_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NewsXController extends GetxController{

  final dio = Dio();

  var articles = <Articles>[].obs;

  Future<void> getNewsByCategory(String category) async {
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(ChuckerDioInterceptor());

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

    articles.value = news.articles;

    // emit(GetArticlesSuccessState());
    // setState(() {});
  }

}