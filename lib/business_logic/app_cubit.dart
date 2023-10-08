import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/remote/responses/six_month_response.dart';
import 'package:news_app/data/remote/responses/top_headlines_response.dart';
import 'package:news_app/data/remote/responses/us_right_response.dart';
import 'package:news_app/data/remote/responses/yesterday_response.dart';

import '../core/constants.dart';
import '../data/remote/request/last_month_request.dart';
import '../data/remote/request/six_month_request.dart';
import '../data/remote/request/top_headlines_request.dart';
import '../data/remote/request/us_right_request.dart';
import '../data/remote/request/yesterday_request.dart';
import '../data/remote/responses/last_month_response.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  int currentIndex = 0;
  YesterdayResponse yesterdayResponse = YesterdayResponse();
  LastMonthRespose lastMonthResponse = LastMonthRespose();
  UsRightResponse usRightResponse = UsRightResponse();
  TopHeadlinesResponse topHeadlinesResponse = TopHeadlinesResponse();
  SixMonthResponse sixMonthResponse = SixMonthResponse();
  List<String> appBarTitles = [
    "Home1",
    "Home2",
    "Home3",
    "Home4",
  ];
  void changeNavigationBar(int index) {
    currentIndex = index;
    emit(ChangeNavigationBar());
  }

  String imageUrl({required String imagePath}) {
    return "$imagesBaseURL$imagePath";
  }

  void getYesterday() {
    emit(AppYesterdayLoadingState());
    YesterdayRequest()
        .yesterdayRequest(
      apiKey: "265fb8dc2b254f53a2f642e2110fad9d",
    )
        .then((value) {
      yesterdayResponse = value;
      emit(AppYesterdaySuccessState());
    }).catchError((error) {
      emit(AppYesterdayErrorState());
    });
  }

  void getLastMonth() {
    emit(AppLastMonthLoadingState());
    LastMonthRequest()
        .lastMonthRequest(
      apiKey: "265fb8dc2b254f53a2f642e2110fad9d",
    )
        .then((value) {
      lastMonthResponse = value;
      emit(AppLastMonthSuccessState());
    }).catchError((error) {
      emit(AppLastMonthErrorState());
    });
  }

  void getUsRight() {
    emit(AppUsRightLoadingState());
    UsRightRequest()
        .usRightRequest(
      apiKey: "265fb8dc2b254f53a2f642e2110fad9d",
    )
        .then((value) {
      usRightResponse = value;
      emit(AppUsRightSuccessState());
    }).catchError((error) {
      emit(AppUsRightErrorState());
    });
  }

  void getTopHeadlines() {
    emit(AppTopHeadlinesLoadingState());
    TopHeadlinesRequest()
        .topHeadlinesRequest(
      apiKey: "265fb8dc2b254f53a2f642e2110fad9d",
    )
        .then((value) {
      topHeadlinesResponse = value;
      emit(AppTopHeadlinesSuccessState());
    }).catchError((error) {
      emit(AppTopHeadlinesErrorState());
    });
  }

  void getSixMonth() {
    emit(AppSixMonthLoadingState());
    SixMonthRequest()
        .sixMonthRequest(
      apiKey: "265fb8dc2b254f53a2f642e2110fad9d",
    )
        .then((value) {
      sixMonthResponse = value;
      emit(AppSixMonthSuccessState());
    }).catchError((error) {
      emit(AppSixMonthErrorState());
    });
  }
}
