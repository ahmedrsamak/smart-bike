// dashboard_button.dart

import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class DashboardButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const DashboardButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  State<DashboardButton> createState() => _DashboardButtonState();
}

class _DashboardButtonState extends State<DashboardButton> {
  bool _isTapped = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isTapped = true);
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isTapped = false);
    if (widget.onTap != null) widget.onTap!();
  }

  void _handleTapCancel() {
    setState(() => _isTapped = false);
  }

  @override
  Widget build(BuildContext context) {
    final Color activeColor = AppColors.primary;
    final Color tappedColor = AppColors.primary.withOpacity(0.4);

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.darkCard,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (_isTapped ? tappedColor : activeColor).withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
              border: Border.all(
                color: _isTapped ? tappedColor : activeColor,
                width: 1.4,
              ),
            ),
            child: Icon(
              widget.icon,
              color: _isTapped ? tappedColor : activeColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
