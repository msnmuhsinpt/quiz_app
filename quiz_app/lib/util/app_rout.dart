import 'package:flutter/cupertino.dart';
import 'package:quiz_app/ui/home/screen/counter_screen.dart';
import 'package:quiz_app/ui/home/screen/score_screen.dart';
import '../ui/home/screen/quiz_page/quiz_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  Route page = CupertinoPageRoute(
    builder: (context) => const CounterScreen(),
  );
  switch (settings.name) {
    case "/counter":
      page = CupertinoPageRoute(
        builder: (context) => const CounterScreen(),
      );
      break;
    case "/quiz":
      page = CupertinoPageRoute(
        builder: (context) => const QuizScreen(),
      );
      break;
    case "/score":
      final arguments = settings.arguments as int;
      page = CupertinoPageRoute(
        builder: (context) => ScoreScreen(score: arguments),
      );
      break;
  }
  return page;
}
