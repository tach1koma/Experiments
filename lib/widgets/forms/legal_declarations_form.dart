import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../shared/form_section_header.dart';
class LegalDeclarationsForm extends StatelessWidget {
  const LegalDeclarationsForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.background,
      child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Declaraciones legales', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 20),
          FormSectionHeader(number: 1, title: 'Declaracion de origen de fondos', child: _CheckDeclaration(text: 'Los recursos provienen de actividades licitas relacionadas con la actividad economica.', label: 'Acepto la declaracion de origen de fondos')),
          const SizedBox(height: 16),
          FormSectionHeader(number: 2, title: 'Declaracion SARLAFT', initiallyExpanded: false, child: _CheckDeclaration(text: 'La empresa no esta vinculada a actividades de lavado de activos ni financiacion del terrorismo.', label: 'Acepto la declaracion SARLAFT')),
          const SizedBox(height: 32),
        ])));
  }
}
class _CheckDeclaration extends StatefulWidget {
  final String text;
  final String label;
  const _CheckDeclaration({required this.text, required this.label});
  @override
  State<_CheckDeclaration> createState() => _CheckDeclarationState();
}
class _CheckDeclarationState extends State<_CheckDeclaration> {
  bool _v = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(widget.text, style: AppTextStyles.label.copyWith(height: 1.6)),
      const SizedBox(height: 16),
      GestureDetector(onTap: () => setState(() => _v = !_v),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AnimatedContainer(duration: const Duration(milliseconds: 200), width: 20, height: 20,
            decoration: BoxDecoration(color: _v ? AppColors.orange : AppColors.white, borderRadius: BorderRadius.circular(4), border: Border.all(color: _v ? AppColors.orange : AppColors.border, width: 1.5)),
            child: _v ? const Icon(Icons.check, color: AppColors.white, size: 14) : null),
          const SizedBox(width: 10),
          Expanded(child: Text(widget.label, style: AppTextStyles.label)),
        ])),
    ]);
  }
}
