import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/util/app_color.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int seconds = maxSeconds;
  static const maxSeconds = 3;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    counter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //animation
        child: AnimatedTextKit(
          animatedTexts: [
            ScaleAnimatedText(
              '$seconds',
              textStyle: const TextStyle(
                  fontSize: 90.0,
                  fontWeight: FontWeight.bold,
                  color: AppColor.kOrange),
            ),
          ],
        ),
      ),
    );
  }

  // the timer
  void counter() {
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        seconds--;
        if (seconds == 0) {
          Navigator.pushNamed(context, '/quiz');
        }
      });
    });
  }
}
