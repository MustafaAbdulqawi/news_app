import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/remote/responses/top_headlines_response.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/app_cubit.dart';
import 'package:news_app/core/screens.dart' as screens;

import '../widgets/default_network_image.dart';
import '../widgets/default_text.dart';

class TopHeadlinesListView extends StatelessWidget {
  final TopHeadlinesArticles topHeadlinesArticles;

  const TopHeadlinesListView({super.key, required TopHeadlinesArticles topHeadlinesArticles2,required this.topHeadlinesArticles});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              screens.topHeadlinesDetails,
              arguments: topHeadlinesArticles,
            );
          },
          child: Column(
            children: [
              DefaultText(
                text: topHeadlinesArticles.title,
                textAlign: TextAlign.center,
                textSize: 15.sp,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultNetworkImage(
                imageURL: topHeadlinesArticles.urlToImage,
              ),
              DefaultText(
                text: topHeadlinesArticles.description,
                maxLines: 3,
                textSize: 12.sp,
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: 1.h,
              ),
              Divider(
                color: Colors.black,
                height: 2.h,
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
