import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/app_cubit.dart';
import 'package:news_app/data/remote/responses/top_headlines_response.dart';
import 'package:news_app/presentation/views/top_headlines_list_view.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_text.dart';

class TopHeadlines extends StatefulWidget {
  const TopHeadlines({super.key});

  @override
  State<TopHeadlines> createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  late AppCubit cubit;
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context)..getTopHeadlines();
    super.didChangeDependencies();
  }

  final TopHeadlinesArticles topHeadlinesArticles = TopHeadlinesArticles();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: const DefaultText(
              text: "Top Headlines",
              textColor: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              if (state is AppTopHeadlinesLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    backgroundColor: Colors.blue,
                  ),
                );
              }else if (state is AppTopHeadlinesErrorState){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 75.sp,
                      ),
                      const DefaultText(text: "error"),
                    ],
                  ),
                );
              }else{
                return ListView.builder(
                  itemBuilder: (context, index) => TopHeadlinesListView(
                    topHeadlinesArticles2: topHeadlinesArticles,
                    topHeadlinesArticles: cubit.topHeadlinesResponse.articles[index],
                  ),
                  itemCount: cubit.topHeadlinesResponse.articles.length,
                );
              }
            },
          ),
        );
      },
    );
  }
}
