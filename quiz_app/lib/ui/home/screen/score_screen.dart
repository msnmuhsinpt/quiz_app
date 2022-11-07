import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/ui/widgets/app_text_view.dart';
import 'package:quiz_app/util/app_constant.dart';

class ScoreScreen extends StatefulWidget {
  final int score;

  const ScoreScreen({required this.score, Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: Lottie.asset(icVictory,
                  width: screenWidth(context) - 20,
                  height: 300,
                  animate: true,
                  repeat: false)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                appTextView(name: 'Your Score is', isBold: true, size: 40),
                appTextView(
                  name: widget.score.toString(),
                  isBold: true,
                  size: 45,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
