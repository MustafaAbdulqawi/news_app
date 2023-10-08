import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/app_cubit.dart';
import 'package:news_app/data/remote/data_provider/my_dio3.dart';
import 'package:news_app/data/remote/data_provider/my_dio5.dart';
import 'package:news_app/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';

import 'data/remote/data_provider/my_dio.dart';
import 'data/remote/data_provider/my_dio2.dart';
import 'data/remote/data_provider/my_dio4.dart';

void main() {
  MyDio.dioInit();
  MyDio2.dioInit();
  MyDio3.dioInit();
  MyDio4.dioInit();
  MyDio5.dioInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => AppCubit(),
          lazy: false,
          child: MaterialApp(
            title: 'News App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.onGenerateRoute,
          ),
        );
      },
    );
  }
}
