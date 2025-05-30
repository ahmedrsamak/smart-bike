// tilt_scooter_display.dart

import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class TiltScooterDisplay extends StatelessWidget {
  final double tiltAngleDegrees; // Tilt angle from gyroscope (-90° to 90°)

  const TiltScooterDisplay({
    Key? key,
    required this.tiltAngleDegrees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define color based on tilt severity
    final Color safetyColor = tiltAngleDegrees.abs() < 15
        ? AppColors.success // Safe tilt
        : tiltAngleDegrees.abs() < 30
        ? AppColors.warning // Moderate tilt
        : AppColors.danger; // Dangerous tilt

    return Container(
      width: 360,
      height: 360,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            safetyColor.withOpacity(0.3),
            safetyColor.withOpacity(0.1),
            AppColors.transparent,
          ],
          radius: 0.9,
        ),
      ),
      child: Center(
        child: Transform.rotate(
          angle: tiltAngleDegrees * math.pi / 180,
          child: Image.asset(
            'assets/images/motorcycle.png', // Make sure this file exists
            width: 300,
            height: 300,
            //color: safetyColor,
          ),
        ),
      ),
    );
  }
}
