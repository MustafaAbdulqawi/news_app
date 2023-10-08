import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/remote/responses/top_headlines_response.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/app_cubit.dart';
import '../widgets/default_network_image.dart';
import '../widgets/default_text.dart';

class TopHeadlinesDetails extends StatelessWidget {
  final TopHeadlinesArticles topHeadlinesArticles;
  const TopHeadlinesDetails({super.key, required this.topHeadlinesArticles});

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
            title: DefaultText(
              text: topHeadlinesArticles.author,
              textColor: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  DefaultText(
                    text: topHeadlinesArticles.title,
                    textAlign: TextAlign.center,
                    textSize: 15.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  DefaultNetworkImage(
                    imageURL: topHeadlinesArticles.urlToImage,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(
                    text: topHeadlinesArticles.description,
                    textSize: 13.sp,
                    weight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultText(
                    text: topHeadlinesArticles.content,
                    textAlign: TextAlign.center,
                    textSize: 13.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(
                    text: topHeadlinesArticles.url,
                    textAlign: TextAlign.center,
                    textSize: 13.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  DefaultText(
                    text: topHeadlinesArticles.publishedAt,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
