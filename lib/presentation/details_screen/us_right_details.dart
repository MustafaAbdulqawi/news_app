import 'package:flutter/material.dart';
import 'package:news_app/data/remote/responses/us_right_response.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_network_image.dart';
import '../widgets/default_text.dart';

class UsRightDetails extends StatelessWidget {
  final UsArticles usArticles;
  const UsRightDetails({super.key, required this.usArticles});

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
          text: usArticles.author,
          textColor: Colors.white,
          weight: FontWeight.bold,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              DefaultText(
                text: usArticles.title,
                textAlign: TextAlign.center,
                textSize: 15.sp,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 2.5.h,
              ),
              DefaultNetworkImage(
                imageURL: usArticles.urlToImage,
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultText(
                text: usArticles.description,
                textSize: 13.sp,
                weight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultText(
                text: usArticles.content,
                textAlign: TextAlign.center,
                textSize: 13.sp,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultText(
                text: usArticles.url,
                textAlign: TextAlign.center,
                textSize: 13.sp,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 3.h,
              ),
              DefaultText(
                text: usArticles.publishedAt,
                weight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
