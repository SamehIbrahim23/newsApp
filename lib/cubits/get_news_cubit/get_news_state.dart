part of 'get_news_cubit.dart';

@immutable
sealed class GetNewsState {}

final class GetNewsInitial extends GetNewsState {}

final class GetNewsLoading extends GetNewsState {}

final class GetNewsFailure extends GetNewsState {
  final String error;

  GetNewsFailure({required this.error});
}

final class GetNewsSuccess extends GetNewsState {
  final List<Article> articleList;

  GetNewsSuccess({required this.articleList});
}
