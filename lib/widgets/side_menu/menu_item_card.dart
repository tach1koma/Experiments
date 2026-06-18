import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/form_section.dart';
class MenuItemCard extends StatelessWidget {
  final FormSection section;
  final bool isSelected;
  final VoidCallback onTap;
  const MenuItemCard({super.key, required this.section, required this.isSelected, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.menuItemBg : AppColors.menuItemInactiveBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.orange.withOpacity(0.4) : AppColors.border, width: isSelected ? 1.5 : 1.0),
          boxShadow: isSelected ? [BoxShadow(color: AppColors.orange.withOpacity(0.12), blurRadius: 8, offset: const Offset(0, 2))] : [],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        child: Row(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40, height: 40,
            decoration: BoxDecoration(color: isSelected ? AppColors.iconBg : AppColors.progressBg, borderRadius: BorderRadius.circular(10)),
            child: Icon(section.icon, color: isSelected ? AppColors.orange : AppColors.textLight, size: 20)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(section.title, style: AppTextStyles.menuTitle),
            const SizedBox(height: 2),
            Text(section.statusLabel, style: AppTextStyles.menuSubtitle.copyWith(color: section.statusColor)),
          ])),
          Icon(Icons.chevron_right, color: isSelected ? AppColors.orange : AppColors.textLight, size: 20),
        ]),
      ));
  }
}
