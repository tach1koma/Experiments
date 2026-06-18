import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/form_section.dart';
import 'menu_item_card.dart';
class MenuPanel extends StatelessWidget {
  final int selectedIndex;
  final List<FormSection> sections;
  final ValueChanged<int> onSectionSelected;
  final bool isMobile;
  final double progress;
  const MenuPanel({super.key, required this.selectedIndex, required this.sections, required this.onSectionSelected, this.isMobile = false, this.progress = 0.0});
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.background,
      child: SingleChildScrollView(child: Padding(
        padding: EdgeInsets.fromLTRB(isMobile ? 20.0 : 24.0, isMobile ? 24.0 : 32.0, isMobile ? 20.0 : 24.0, 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Queremos conocer\nmas de tu empresa', style: isMobile ? AppTextStyles.headline.copyWith(fontSize: 24) : AppTextStyles.headline),
          const SizedBox(height: 6),
          Container(width: 28, height: 3, decoration: BoxDecoration(color: AppColors.orange, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 24),
          _ProgressSection(progress: progress),
          const SizedBox(height: 16),
          Text('Completa la informacion', style: AppTextStyles.completeLabel),
          const SizedBox(height: 12),
          ...sections.asMap().entries.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: MenuItemCard(section: e.value, isSelected: selectedIndex == e.key, onTap: () => onSectionSelected(e.key)))),
          const SizedBox(height: 24),
          SizedBox(width: double.infinity,
            child: ElevatedButton(
              onPressed: progress >= 1.0 ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange, disabledBackgroundColor: AppColors.progressBg,
                foregroundColor: AppColors.white, disabledForegroundColor: AppColors.textLight,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), elevation: 0),
              child: Text('Continuar', style: progress >= 1.0 ? AppTextStyles.buttonActive : AppTextStyles.button))),
        ]))));
  }
}
class _ProgressSection extends StatelessWidget {
  final double progress;
  const _ProgressSection({required this.progress});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('En proceso', style: AppTextStyles.progressLabel),
        Text('${(progress * 100).round()}%', style: AppTextStyles.progressLabel),
      ]),
      const SizedBox(height: 8),
      ClipRRect(borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(value: progress, backgroundColor: AppColors.progressBg,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.orange), minHeight: 6)),
    ]);
  }
}
