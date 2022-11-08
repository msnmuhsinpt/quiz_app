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
  Timer? timer;

  @override
  void initState() {
    super.initState();
    counter();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //animation
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 75.0,
            color: AppColor.kOrange,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              ScaleAnimatedText('3', duration: const Duration(seconds: 1)),
              ScaleAnimatedText('2', duration: const Duration(seconds: 1)),
              ScaleAnimatedText('1', duration: const Duration(seconds: 1)),
              ScaleAnimatedText('Go!', duration: const Duration(seconds: 1)),
            ],
          ),
        ),
      ),
    );
  }

  // the timer
  /* void counter() async {

    timer1 = Timer.periodic(const Duration(seconds: 4), (_) {
      setState(() {
        _seconds--;
      });
      if (_seconds < 1) {
        Future.delayed(Duration(milliseconds: 5000), () {
          // Your code
          log("hrtrt" + _seconds.toString());
          Navigator.pushNamedAndRemoveUntil(context, '/quiz', (route) => false);
        });
      }
    });
  }*/
  void counter() {
    timer = Timer.periodic(const Duration(seconds: 8), (_) {
      Navigator.pushNamedAndRemoveUntil(context, '/quiz', (route) => false);
    });
  }
}
