import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/remote/responses/six_month_response.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/app_cubit.dart';
import '../widgets/default_network_image.dart';
import '../widgets/default_text.dart';

class SixMonthDetails extends StatelessWidget {
  final SixMonthArticles sixMonthArticles;
  const SixMonthDetails({super.key, required this.sixMonthArticles});

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
              text: sixMonthArticles.author,
              textColor: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  DefaultText(
                    text: sixMonthArticles.title,
                    textAlign: TextAlign.center,
                    textSize: 15.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  DefaultNetworkImage(
                    imageURL: sixMonthArticles.urlToImage,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(
                    text: sixMonthArticles.description,
                    textSize: 13.sp,
                    weight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultText(
                    text: sixMonthArticles.content,
                    textAlign: TextAlign.center,
                    textSize: 13.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(
                    text: sixMonthArticles.url,
                    textAlign: TextAlign.center,
                    textSize: 13.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  DefaultText(
                    text: sixMonthArticles.publishedAt,
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
