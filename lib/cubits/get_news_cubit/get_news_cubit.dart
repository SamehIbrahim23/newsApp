import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../constants.dart';
import '../../models/article.dart';
import '../../services/news_service.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(GetNewsInitial());

  getNews() async {
    emit(GetNewsLoading());
    try {
      List<Article> articles = await NewsServices().getData(
          path: ApiConstant.baseUrl + ApiConstant.newsEndpoints,
          query: {"apiKey": ApiConstant.apiKey, "q": "bitcoin"});

      emit(GetNewsSuccess(articleList: articles));
    } catch (e) {
      emit(GetNewsFailure(error: e.toString()));
    }
  }
}
