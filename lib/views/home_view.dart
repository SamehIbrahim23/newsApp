import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_news_cubit/get_news_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "News",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Cloud",
                  style: TextStyle(
                      color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                ),
              ],
            )),
        body: BlocBuilder<GetNewsCubit, GetNewsState>(
          builder: (context, state) {
            if (state is GetNewsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              );
            } else if (state is GetNewsSuccess) {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.articleList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                state.articleList[index].urlToImage,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            height: 9,
                          ),
                          Text(
                            state.articleList[index].title,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            state.articleList[index].content,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                          )
                        ],
                      ),
                    );
                  });
            } else if (state is GetNewsFailure) {
              return Center(
                child: Text(
                  'Failed to load news: ${state.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(child: Text("No data available"));
            }
          },
        ));
  }
}
