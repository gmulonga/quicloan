import 'package:flutter/material.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:quicloan/Contstants.dart';

class ProgressBars extends StatelessWidget {
  final double percentageValue;
  final double daysProgress;
  final double maxDays;

  ProgressBars({
    required this.percentageValue,
    required this.daysProgress,
    required this.maxDays,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: DashedCircularProgressBar.aspectRatio(
            aspectRatio: 1, // width ÷ height
            valueNotifier: ValueNotifier(percentageValue),
            progress: percentageValue,
            maxProgress: 100,
            corners: StrokeCap.butt,
            foregroundColor: kOrange,
            backgroundColor: kCream,
            foregroundStrokeWidth: 7,
            backgroundStrokeWidth: 7,
            animation: true,
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: ValueNotifier(percentageValue),
                builder: (_, double value, __) => Text(
                  '${value.toInt()}%',
                  style: TextStyle(
                    color: kCream,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          height: 80,
          child: DashedCircularProgressBar.aspectRatio(
            aspectRatio: 1,
            valueNotifier: ValueNotifier(daysProgress / maxDays * 100),
            progress: daysProgress,
            maxProgress: maxDays,
            startAngle: 225,
            sweepAngle: 270,
            foregroundColor: kOrange,
            backgroundColor: kCream,
            foregroundStrokeWidth: 7,
            backgroundStrokeWidth: 7,
            animation: true,
            seekSize: 6,
            seekColor: kWhite,
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: ValueNotifier(daysProgress / maxDays * 100),
                builder: (_, double value, __) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${daysProgress.toInt()}',
                      style: TextStyle(
                        color: kCream,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
