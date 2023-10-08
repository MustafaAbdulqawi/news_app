import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/app_cubit.dart';
import 'package:news_app/data/remote/responses/us_right_response.dart';
import 'package:news_app/presentation/views/us_right_list_views.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_text.dart';

class UsRight extends StatefulWidget {
  const UsRight({super.key});

  @override
  State<UsRight> createState() => _UsRightState();
}

class _UsRightState extends State<UsRight> {
  late AppCubit cubit;
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context)..getUsRight();
    super.didChangeDependencies();
  }

  final UsArticles usArticles = UsArticles();
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
              text: "US right now",
              textColor: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              if (state is AppUsRightLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    backgroundColor: Colors.blue,
                  ),
                );
              }else if (state is AppUsRightErrorState){
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
                  itemBuilder: (context, index) => UsRightListViews(
                    usArticles2: usArticles,
                    usArticles: cubit.usRightResponse.articles[index],
                  ),
                  itemCount: cubit.usRightResponse.articles.length,
                );
              }
            },
          ),

        );
      },
    );
  }
}
