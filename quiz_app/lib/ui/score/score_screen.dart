import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/model/questing_model.dart';
import 'package:quiz_app/util/app_color.dart';
import 'package:quiz_app/util/app_constant.dart';

import '../common/widgets/app_text_view.dart';

class ScoreScreen extends StatefulWidget {
  final int score;

  const ScoreScreen({required this.score, Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: victoryAnimation(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                appTextView(name: 'Your Score Is', isBold: true, size: 30),
                appTextView(
                  name: widget.score != 0 ? '${widget.score}0' : '0',
                  isBold: true,
                  size: 45,
                ),
                dividerH(),
                dividerH(),
                SizedBox(
                  height: 35,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.kBlue),
                    onPressed: () {
                      setState(() {
                        //clear selected data
                        for (int i = 0; i < questions.length; i++) {
                          questions[i].isLocked = false;
                        }
                      });

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/counter',
                        (route) => false,
                      );
                    },
                    child: appTextView(
                        name: 'Play Again',
                        isBold: true,
                        color: AppColor.kWhite),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //animation
  Widget victoryAnimation() {
    return Lottie.asset(icVictory,
        width: screenWidth(context) - 20, height: 300, repeat: true);
  }
}
