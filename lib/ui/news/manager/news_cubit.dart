import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:instant2/ui/news/model/news_response.dart';
import 'package:meta/meta.dart';

import '../../../shared.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  final dio = Dio();

  List<Articles> articles = [];

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

    emit(GetArticlesSuccessState());
    // setState(() {});
  }
}
