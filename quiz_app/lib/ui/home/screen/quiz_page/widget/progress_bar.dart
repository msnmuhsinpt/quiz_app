/*
import 'package:flutter/cupertino.dart';
import 'package:quiz_app/util/app_color.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.kProgressBar, width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              // LayoutBuilder provide us the available space for the container
              // constraints.maxWidth needed for our animation
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  // from 0 to 1 it takes 60s
                  width: constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${(controller.animation.value * 60).round()} sec"),
                    //SvgPicture.asset("assets/icons/clock.svg"),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
*/