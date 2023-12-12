part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class GetArticlesSuccessState extends NewsState {}

class GetArticlesFailureState extends NewsState {
  final String errorMessage;

  GetArticlesFailureState(this.errorMessage);
}
