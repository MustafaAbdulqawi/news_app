import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/app_cubit.dart';
import 'package:news_app/presentation/views/last_month_views.dart';
import 'package:news_app/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../data/remote/responses/last_month_response.dart';

class HomeLastMonth extends StatefulWidget {
  const HomeLastMonth({super.key});

  @override
  State<HomeLastMonth> createState() => _HomeLastMonthState();
}

class _HomeLastMonthState extends State<HomeLastMonth> {
  late AppCubit cubit;
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context)..getLastMonth();
    super.didChangeDependencies();
  }
  final Articles articless2 = Articles();
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
              text: "Last Month About Tesla",
              textColor: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              if (state is AppLastMonthLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    backgroundColor: Colors.blue,
                  ),
                );
              }else if (state is AppLastMonthErrorState){
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
                  itemBuilder: (context, index) =>LastMonthViews(
                    articless: articless2,
                    articles2: cubit.lastMonthResponse.articles[index],
                  ),
                  itemCount:cubit.lastMonthResponse.articles.length,
                );
              }
            },
          ),


        );
      },
    );
  }
}
