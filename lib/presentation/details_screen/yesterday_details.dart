import 'package:flutter/material.dart';
import 'package:news_app/presentation/widgets/default_network_image.dart';
import 'package:sizer/sizer.dart';

import '../../data/remote/responses/yesterday_response.dart';
import '../widgets/default_text.dart';

class YesterdayDetails extends StatelessWidget {
  final YesterdayArticles articlesss;
  const YesterdayDetails({super.key, required this.articlesss});

  @override
  Widget build(BuildContext context) {
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
          text: articlesss.author,
          textColor: Colors.white,
          weight: FontWeight.bold,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              DefaultText(
                text: articlesss.title,
                textAlign: TextAlign.center,
                textSize: 15.sp,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultNetworkImage(
                imageURL: articlesss.urlToImage,
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultText(
                text: articlesss.description,
                textSize: 13.sp,
                weight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultText(
                text: articlesss.content,
                textAlign: TextAlign.center,
                textSize: 13.sp,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultText(
                text: articlesss.url,
                textAlign: TextAlign.center,
                textSize: 13.sp,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 3.h,
              ),
              DefaultText(
                text: articlesss.publishedAt,
                weight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
