import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/app_cubit.dart';
import 'package:news_app/data/remote/responses/yesterday_response.dart';
import 'package:news_app/presentation/views/yesterday_list_views.dart';
import 'package:news_app/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
import 'package:news_app/core/screens.dart' as screens;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AppCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context)
      ..getYesterday();
      // ..getLastMonth()
      // ..getUsRight();
    super.didChangeDependencies();
  }

  final YesterdayArticles articles = YesterdayArticles();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          // backgroundColor: Colors.grey,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const DefaultText(
              text: "Yesterday",
              textColor: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          drawer: Drawer(
            width: 85.w,
            backgroundColor: Colors.white,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 9.h,
                    ),
                    DefaultText(
                      text: "Click on any page you want to know the news about it",
                      textAlign: TextAlign.center,
                      textSize: 13.sp,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        screens.homeLastMonth,
                      ),
                      child: Container(
                        width: 90.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            DefaultText(
                              text: "Last Month About Tesla",
                              textColor: Colors.black,
                              textSize: 11.5.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        screens.usRight,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        child: DefaultText(
                          text: "Top business headlines in the US right now",
                          textColor: Colors.black,
                          textSize: 11.5.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        screens.topHeadlines,
                      ),
                      child: Container(
                        height: 8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          color: Colors.grey[300],
                        ),
                        alignment: Alignment.center,
                        child: DefaultText(
                          text: "Top headlines from TechCrunch right now",
                          textColor: Colors.black,
                          textSize: 11.5.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        screens.sixMonth,
                      ),
                      child: Container(
                        height: 8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          color: Colors.grey[300],
                        ),
                        alignment: Alignment.center,
                        child: DefaultText(
                          text:
                              "All articles published by the Wall Street Journal in the last 6 months",
                          textColor: Colors.black,
                          textSize: 11.5.sp,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              if (state is AppYesterdayLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    backgroundColor: Colors.blue,
                  ),
                );
              }else if (state is AppYesterdayErrorState){
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
                  itemBuilder: (context, index) => YesterdayListView(
                    articles: articles,
                    articless: cubit.yesterdayResponse.articles[index],
                  ),
                  itemCount: cubit.yesterdayResponse.articles.length,
                );
              }
            },
          ),
        );
      },
    );
  }
}
