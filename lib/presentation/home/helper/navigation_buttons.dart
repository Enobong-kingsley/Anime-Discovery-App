import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const NavigationButtons({
    required this.onNext,
    required this.onPrevious,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primary,
          radius: 24,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
            onPressed: onPrevious,
          ),
        ),
        const SizedBox(width: 20.0),
        CircleAvatar(
          backgroundColor: AppColors.primary,
          radius: 24,
          child: IconButton(
            icon:
                const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
            onPressed: onNext,
          ),
        ),
      ],
    );
  }
}
