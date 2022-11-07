import 'package:flutter/material.dart';
import 'package:quiz_app/model/questing_model.dart';
import 'package:quiz_app/ui/widgets/app_text_view.dart';
import 'package:quiz_app/util/app_color.dart';
import 'package:quiz_app/util/app_constant.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionNumber = 1;
  late PageController _controller;
  int _score = 0;
  bool _isLocked = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
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
                  _questionNumber++;
                  _isLocked = false;
                });
              } else {
                //score page
                Navigator.pushNamed(context, '/score', arguments: _score);
              }
            },
            child: appTextView(name: 'Skip', isBold: true),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: commonPaddingLR,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              appTextView(
                  name: 'Question$_questionNumber/${questions.length}',
                  isBold: true,
                  size: 30),
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
                    final _question = questions[index];
                    return buildQuestion(_question);
                  },
                ),
              ),
              //space
              _isLocked ? buildElevatedButton() : const SizedBox.shrink(),
              dividerH(),
            ],
          ),
        ),
      ),
    );
  }

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
                  setState(() {
                    _score++;
                  });
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
            _questionNumber++;
            _isLocked = false;
          });
        } else {
          //score page
          Navigator.pushNamed(context, '/score', arguments: _score);
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
}

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickOption;

  const OptionWidget(
      {Key? key, required this.question, required this.onClickOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.options
            .map((option) => buildOption(context, option))
            .toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickOption(option),
      child: Container(
        height: 50,
        padding: commonPaddingAll,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.kLightGrey,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appTextView(name: option.text, isBold: true),
            getIconForOption(option, question),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? AppColor.kGreen : AppColor.kRed;
      } else if (option.isCorrect) {
        return AppColor.kGreen;
      }
    }
    return AppColor.kLightGrey;
  }

  Widget getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(
                Icons.check_circle,
                color: AppColor.kGreen,
              )
            : const Icon(
                Icons.cancel,
                color: AppColor.kRed,
              );
      } else if (option.isCorrect) {
        return const Icon(
          Icons.check_circle,
          color: AppColor.kGreen,
        );
      }
    }
    return const SizedBox.shrink();
  }
}
