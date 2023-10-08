import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/app_cubit.dart';
import 'package:news_app/presentation/widgets/default_network_image.dart';
import 'package:news_app/presentation/widgets/default_text.dart';
import 'package:news_app/core/screens.dart' as screens;
import 'package:sizer/sizer.dart';

import '../../data/remote/responses/last_month_response.dart';

class LastMonthViews extends StatelessWidget {
  final Articles articles2;

  const LastMonthViews(
      {super.key, required Articles articless, required this.articles2});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              screens.lastMonthDetails,
              arguments: articles2,
            );
          },
          child: Column(
            children: [
              DefaultText(
                text: articles2.title,
                textAlign: TextAlign.center,
                textSize: 15.sp,
                weight: FontWeight.bold,
              ),
              SizedBox(height: 2.h,),
              DefaultNetworkImage(
                imageURL: articles2.urlToImage,
              ),
              DefaultText(
                text: articles2.description,
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
