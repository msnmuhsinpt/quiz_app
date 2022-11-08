import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../util/app_color.dart';
import '../../common/widgets/app_text_view.dart';

class ProgressIndicatorIndicator extends StatelessWidget {
  final int second;
  final int score;
  const ProgressIndicatorIndicator(this.second,this.score,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LinearPercentIndicator(
      animation: true,
      lineHeight: 40,
      barRadius: const Radius.circular(20),
      percent: 0.999,
      center: appTextView(
          name: '$second' 's', isBold: true, color: AppColor.kWhite),
      onAnimationEnd: () {
        Navigator.pushNamedAndRemoveUntil(context, '/score', (route) => false,
            arguments: score);
      },
      //10 seconds
      animationDuration: 30000,
      progressColor: AppColor.kBlue,
      backgroundColor: AppColor.kProgressBar,
    );
  }
}
