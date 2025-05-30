// sensor_circle_widget.dart

import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class SensorCircleWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final bool enableTapEffect; // New flag to enable/disable tap feedback

  const SensorCircleWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.onTap,
    this.enableTapEffect = false, // Default: enabled
  }) : super(key: key);

  @override
  State<SensorCircleWidget> createState() => _SensorCircleWidgetState();
}

class _SensorCircleWidgetState extends State<SensorCircleWidget> {
  bool _isTapped = false;

  void _handleTapDown(TapDownDetails details) {
    if (widget.enableTapEffect) {
      setState(() => _isTapped = true);
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.enableTapEffect) {
      setState(() => _isTapped = false);
    }
    if (widget.onTap != null) widget.onTap!();
  }

  void _handleTapCancel() {
    if (widget.enableTapEffect) {
      setState(() => _isTapped = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color activeColor = widget.color;
    final Color tappedColor = widget.color.withOpacity(0.5);

    return Column(
      children: [
        GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.darkCard,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (_isTapped ? tappedColor : activeColor).withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: _isTapped ? tappedColor : activeColor,
                width: 1.3,
              ),
            ),
            child: Center(
              child: Icon(
                widget.icon,
                size: 28,
                color: _isTapped ? tappedColor : activeColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
        Text(
          widget.value,
          style: TextStyle(
            color: widget.color,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
