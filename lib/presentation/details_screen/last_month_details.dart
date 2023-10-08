import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/app_cubit.dart';
import 'package:news_app/presentation/widgets/default_network_image.dart';
import 'package:news_app/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../data/remote/responses/last_month_response.dart';

class LastMonthDetails extends StatelessWidget {
  final Articles articless2;
  const LastMonthDetails({
    super.key,
    required this.articless2,
  });

  @override
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
              text: articless2.author,
              textColor: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  DefaultText(
                    text: articless2.title,
                    textAlign: TextAlign.center,
                    textSize: 15.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  DefaultNetworkImage(
                    imageURL: articless2.urlToImage,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(
                    text: articless2.description,
                    textSize: 13.sp,
                    weight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultText(
                    text: articless2.content,
                    textAlign: TextAlign.center,
                    textSize: 13.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(
                    text: articless2.url,
                    textAlign: TextAlign.center,
                    textSize: 13.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  DefaultText(
                    text: articless2.publishedAt,
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
