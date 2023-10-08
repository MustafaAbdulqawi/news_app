import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/remote/responses/us_right_response.dart';
import 'package:news_app/core/screens.dart' as screens;
import 'package:sizer/sizer.dart';

import '../../business_logic/app_cubit.dart';
import '../widgets/default_network_image.dart';
import '../widgets/default_text.dart';

class UsRightListViews extends StatelessWidget {
  final UsArticles usArticles;
  const UsRightListViews({super.key,required UsArticles usArticles2 ,required this.usArticles});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              screens.usRightDetails,
              arguments: usArticles,
            );
          },
          child: Column(
            children: [
              DefaultText(
                text: usArticles.title,
                textAlign: TextAlign.center,
                textSize: 15.sp,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultNetworkImage(
                imageURL: usArticles.urlToImage,
              ),
              DefaultText(
                text: usArticles.description,
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
