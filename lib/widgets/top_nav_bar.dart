import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
class TopNavBar extends StatelessWidget {
  final VoidCallback? onBack;
  final bool showBackArrow;
  const TopNavBar({super.key, this.onBack, this.showBackArrow = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, color: AppColors.topNav,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(children: [
        GestureDetector(onTap: onBack, child: Opacity(opacity: onBack != null ? 1.0 : 0.5,
          child: const Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.chevron_left, color: AppColors.white, size: 20),
            SizedBox(width: 2), Text('Volver', style: AppTextStyles.navItem),
          ]))),
        const Spacer(),
        const Text('Conocamonos', style: AppTextStyles.navTitle),
        const Spacer(),
        const Row(mainAxisSize: MainAxisSize.min, children: [
          Text('Salir', style: AppTextStyles.navItem), SizedBox(width: 4),
          Icon(Icons.logout_rounded, color: AppColors.white, size: 16),
        ]),
      ]),
    );
  }
}
