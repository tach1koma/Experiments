import 'package:flutter/material.dart';
import 'app_colors.dart';
class AppTextStyles {
  AppTextStyles._();
  static const TextStyle headline = TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.textDark, height: 1.3);
  static const TextStyle sectionTitle = TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textDark);
  static const TextStyle menuTitle = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textDark);
  static const TextStyle menuSubtitle = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textLight);
  static const TextStyle label = TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textMedium, height: 1.4);
  static const TextStyle input = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textDark);
  static const TextStyle placeholder = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textPlaceholder);
  static const TextStyle navItem = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.white);
  static const TextStyle navTitle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white);
  static const TextStyle progressLabel = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textMedium);
  static const TextStyle button = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textLight);
  static const TextStyle buttonActive = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.white);
  static const TextStyle sectionHeader = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textDark);
  static const TextStyle completeLabel = TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textMedium);
}
