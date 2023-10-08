part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}
class ChangeNavigationBar extends AppState {}
class AppYesterdayLoadingState extends AppState {}
class AppYesterdaySuccessState extends AppState {}
class AppYesterdayErrorState extends AppState {}
class AppLastMonthLoadingState extends AppState {}
class AppLastMonthSuccessState extends AppState {}
class AppLastMonthErrorState extends AppState {}
class AppUsRightLoadingState extends AppState {}
class AppUsRightSuccessState extends AppState {}
class AppUsRightErrorState extends AppState {}
class AppTopHeadlinesLoadingState extends AppState {}
class AppTopHeadlinesSuccessState extends AppState {}
class AppTopHeadlinesErrorState extends AppState {}
class AppSixMonthLoadingState extends AppState {}
class AppSixMonthSuccessState extends AppState {}
class AppSixMonthErrorState extends AppState {}
