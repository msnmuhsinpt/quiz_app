import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/model/questing_model.dart';
import 'package:quiz_app/util/app_color.dart';
import 'package:quiz_app/util/app_constant.dart';
import '../../common/widgets/app_text_view.dart';
import '../widget/progress_bar.dart';
import '../widget/quiz_option_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //quiz
  int _questionNumber = 1;
  late PageController _controller;
  int _score = 0;
  bool _isLocked = false;
  double pQuestionNumber = 0.00;

  //timer
  int _seconds = _maxSeconds;
  static const _maxSeconds = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);


    counter();
  }

  @override
  void dispose() {
    super.dispose();
    // stop timer
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              if (_questionNumber < questions.length) {
                _controller.nextPage(
                    duration: const Duration(microseconds: 250),
                    curve: Curves.easeInExpo);
                setState(() {
                  //progress bar increases
                  progressValue();

                  _questionNumber++;
                  _isLocked = false;
                });
              } else {
                //score page
                Navigator.pushNamedAndRemoveUntil(
                    context, '/score', (route) => false,
                    arguments: _score);
              }
            },
            child: appTextView(name: 'Skip', isBold: true),
          ),
        ],
      ),
      //ui
      body: quizUiWidget(),
    );
  }

  //ui
  Widget quizUiWidget() {
    return SafeArea(
      child: Padding(
        //common padding
        padding: commonPaddingLR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //linear bar
            LinearProgressIndicator(
              backgroundColor: AppColor.kBlue,
              minHeight: 5,
              value: pQuestionNumber,
              valueColor: const AlwaysStoppedAnimation(Colors.green),
            ),
            dividerSH(),
            //progress bar
            ProgressIndicatorIndicator(_seconds, _score),
            appTextView(
                name: 'Question$_questionNumber/${questions.length}',
                isBold: true,
                size: 25),
            const Divider(
              thickness: 1,
              color: AppColor.kGrey,
            ),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: questions.length,
                controller: _controller,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return Padding(
                    padding: commonPaddingLR,
                    child: buildQuestion(question),
                  );
                },
              ),
            ),
            //button
            _isLocked ? buildElevatedButton() : const SizedBox.shrink(),
            dividerH(),
          ],
        ),
      ),
    );
  }

  //question area
  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        appTextView(name: question.text, isBold: true, size: 20, maxLines: 5),
        Expanded(
          child: OptionWidget(
            question: question,
            onClickOption: (option) {
              if (question.isLocked) {
                return;
              } else {
                setState(() {
                  question.isLocked = true;
                  question.selectedOption = option;
                });
                _isLocked = question.isLocked;
                if (question.selectedOption!.isCorrect) {
                  setState(
                    () {
                      // if correct got 10 point
                      _score++;
                    },
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }

  //bottom button
  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _questionNumber < questions.length
            ? AppColor.kBlue
            : AppColor.kGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        if (_questionNumber < questions.length) {
          _controller.nextPage(
              duration: const Duration(microseconds: 250),
              curve: Curves.easeInExpo);
          setState(() {
            progressValue();
            //timer
            _questionNumber++;
            _isLocked = false;
          });
        } else {
          //score page
          Navigator.pushNamedAndRemoveUntil(context, '/score', (route) => true,
              arguments: _score);
        }
      },
      child: appTextView(
          name: _questionNumber < questions.length
              ? 'Next Page'
              : 'See The Result',
          isBold: true,
          color: _questionNumber < questions.length
              ? AppColor.kWhite
              : AppColor.kBlack),
    );
  }

  //index value
  void progressValue() {
    if (_questionNumber == 1) {
      setState(() {
        pQuestionNumber = 0.33;
      });
    } else if (_questionNumber == 2) {
      setState(() {
        pQuestionNumber = 0.66;
      });
    } else {
      setState(() {
        pQuestionNumber = 0.999;
      });
    }
  }

  //timer loop
  void counter() async {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _seconds--;
      });
    });
  }
}
