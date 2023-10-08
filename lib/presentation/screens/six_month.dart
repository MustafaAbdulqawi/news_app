import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/remote/responses/six_month_response.dart';
import 'package:news_app/presentation/views/six_month_list_view.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/app_cubit.dart';
import '../widgets/default_text.dart';

class SixMonth extends StatefulWidget {
  const SixMonth({super.key});

  @override
  State<SixMonth> createState() => _SixMonthState();
}

class _SixMonthState extends State<SixMonth> {
  late AppCubit cubit;
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context)..getSixMonth();
    super.didChangeDependencies();
  }

  final SixMonthArticles sixMonthArticles = SixMonthArticles();
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
              text: "All Articles in Six Month Ago",
              textColor: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              if (state is AppSixMonthLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    backgroundColor: Colors.blue,
                  ),
                );
              }else if (state is AppSixMonthErrorState){
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
                  itemBuilder: (context, index) => SixMonthListView(
                    sixMonthArticles2: sixMonthArticles,
                    sixMonthArticles: cubit.sixMonthResponse.articles[index],
                  ),
                  itemCount: cubit.sixMonthResponse.articles.length,
                );
              }
            },
          ),

        );
      },
    );
  }
}
