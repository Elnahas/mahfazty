import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/fonts.dart';

class PercentsWidget extends StatelessWidget {

  final String centerText ;
  final String footerText ;
  final double percent ;
  final Color progressColor ;

  const PercentsWidget({super.key, required this.centerText, required this.footerText, required this.percent,  this.progressColor = ColorsApp.redColor});

  @override
  Widget build(BuildContext context) {
    return   CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 12.0,
                    percent: percent,
                    arcType: ArcType.FULL,
                    arcBackgroundColor: Colors.transparent,
                    
                    center: Text("$centerText%" , style: FontHelper.font18BoldWhite,),
                    footer: Text("$footerText" , style: FontHelper.font18BoldWhite,),
                    progressColor: progressColor,
                  );
  }
}