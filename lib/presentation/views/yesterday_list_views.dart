import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/app_cubit.dart';
import 'package:news_app/data/remote/responses/yesterday_response.dart';
import 'package:news_app/presentation/widgets/default_network_image.dart';
import 'package:news_app/core/screens.dart' as screens;
import 'package:sizer/sizer.dart';

import '../widgets/default_text.dart';

class YesterdayListView extends StatelessWidget {
  final YesterdayArticles articless;
  const YesterdayListView(
      {super.key,
      required YesterdayArticles articles,
      required this.articless});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              screens.yesterdayDetails,
              arguments: articless,
            );
          },
          child: Column(
            children: [
              DefaultText(
                text: articless.title,
                textAlign: TextAlign.center,
                textSize: 15.sp,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultNetworkImage(
                imageURL: articless.urlToImage,
              ),
              DefaultText(
                text: articless.description,
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
