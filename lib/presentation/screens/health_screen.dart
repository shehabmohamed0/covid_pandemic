import 'package:covid_pandemic/data/models/news.dart';
import 'package:covid_pandemic/logic/cubit/articles/articles_cubit.dart';
import 'package:covid_pandemic/presentation/widgets/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ArticlesCubit>(context, listen: false)
    //     .getNewsByCategory('health');
    return BlocProvider(
      create: (context) => ArticlesCubit()..getNewsByCategory('health'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Health Screen'),
        ),
        body: SafeArea(
          child: BlocBuilder<ArticlesCubit, ArticlesState>(
            builder: (BuildContext context, state) {
              if (state is ArticlesLoaded) {
                return ListView.separated(
                  itemBuilder: (ctx, index) => NewsItem(
                    article: state.articles[index],
                  ),
                  itemCount: state.articles.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    thickness: 5,
                    color: Colors.blueAccent,
                  ),
                );
              } else if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is Error) {
                return Center(
                  child: Text(
                    "Error",
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                );
              }
              return const Text('Something went wrong');
            },
          ),
        ),
      ),
    );
  }
}
