import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
class CustomDropdownField extends StatefulWidget {
  final String label;
  final String placeholder;
  final List<String> options;
  const CustomDropdownField({super.key, required this.label, required this.placeholder, required this.options});
  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}
class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? _val;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
      Text(widget.label, style: AppTextStyles.label),
      const SizedBox(height: 6),
      DropdownButtonFormField<String>(
        value: _val,
        hint: Text(widget.placeholder, style: AppTextStyles.placeholder),
        style: AppTextStyles.input,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textLight),
        decoration: InputDecoration(
          filled: true, fillColor: AppColors.inputBg,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.border)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.border)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.orange, width: 1.5)),
        ),
        items: widget.options.map((o) => DropdownMenuItem(value: o, child: Text(o, style: AppTextStyles.input))).toList(),
        onChanged: (v) => setState(() => _val = v),
      ),
    ]);
  }
}
