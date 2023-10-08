import 'package:flutter/material.dart';
import 'package:news_app/data/remote/responses/six_month_response.dart';
import 'package:news_app/data/remote/responses/top_headlines_response.dart';
import 'package:news_app/data/remote/responses/us_right_response.dart';
import 'package:news_app/data/remote/responses/yesterday_response.dart';
import 'package:news_app/presentation/details_screen/last_month_details.dart';
import 'package:news_app/presentation/details_screen/six_month_details.dart';
import 'package:news_app/presentation/details_screen/top_headlines_details.dart';
import 'package:news_app/presentation/details_screen/us_right_details.dart';
import 'package:news_app/presentation/screens/home.dart';
import 'package:news_app/core/screens.dart' as screens;
import 'package:news_app/presentation/details_screen/yesterday_details.dart';
import 'package:news_app/presentation/screens/home_last_month.dart';
import 'package:news_app/presentation/screens/six_month.dart';
import 'package:news_app/presentation/screens/top_headlines.dart';
import 'package:news_app/presentation/screens/us_right.dart';

import '../../data/remote/responses/last_month_response.dart';

class AppRouter {
  late Widget startScreen;
  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const Home();
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLastMonth:
        return MaterialPageRoute(builder: (_) => const HomeLastMonth());
      case screens.usRight:
        return MaterialPageRoute(builder: (_) => const UsRight());
      case screens.topHeadlines:
        return MaterialPageRoute(builder: (_) => const TopHeadlines());
      case screens.sixMonth:
        return MaterialPageRoute(builder: (_) => const SixMonth());

      case screens.yesterdayDetails:
        YesterdayArticles articles = settings.arguments as YesterdayArticles;
        return MaterialPageRoute(
            builder: (_) => YesterdayDetails(articlesss: articles));

      case screens.topHeadlinesDetails:
        TopHeadlinesArticles topHeadlinesArticles =
            settings.arguments as TopHeadlinesArticles;
        return MaterialPageRoute(
          builder: (_) => TopHeadlinesDetails(
            topHeadlinesArticles: topHeadlinesArticles,
          ),
        );

      case screens.usRightDetails:
        UsArticles usArticles = settings.arguments as UsArticles;
        return MaterialPageRoute(
          builder: (_) => UsRightDetails(
            usArticles: usArticles,
          ),
        );

      case screens.lastMonthDetails:
        Articles articless = settings.arguments as Articles;
        return MaterialPageRoute(
          builder: (_) => LastMonthDetails(
            articless2: articless,
          ),
        );
      case screens.sixMonthDetails:
        SixMonthArticles sixMonthArticles =
            settings.arguments as SixMonthArticles;
        return MaterialPageRoute(
          builder: (_) => SixMonthDetails(
            sixMonthArticles: sixMonthArticles,
          ),
        );
    }
    return null;
  }
}
