import 'package:flutter/material.dart';

import '../../../model/questing_model.dart';
import '../../../util/app_color.dart';
import '../../../util/app_constant.dart';
import '../../common/widgets/app_text_view.dart';

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
        children:
            question.options.map((option) => buildOption(option)).toList(),
      ),
    );
  }

  //questions options
  Widget buildOption(Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      //click event
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

  //answer correct or not condition color change
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

  //icon
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
