import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? initialValue;
  final bool hasInfoIcon;
  final TextInputType keyboardType;
  const CustomTextField({super.key, required this.label, required this.placeholder, this.initialValue, this.hasInfoIcon = false, this.keyboardType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
        Expanded(child: Text(label, style: AppTextStyles.label)),
        if (hasInfoIcon) const Icon(Icons.info_outline, size: 14, color: AppColors.textLight),
      ]),
      const SizedBox(height: 6),
      TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        style: AppTextStyles.input,
        decoration: InputDecoration(
          hintText: placeholder, hintStyle: AppTextStyles.placeholder,
          filled: true, fillColor: AppColors.inputBg,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.border)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.border)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.orange, width: 1.5)),
        ),
      ),
    ]);
  }
}
