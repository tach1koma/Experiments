import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../shared/form_section_header.dart';
class BindingFormatForm extends StatelessWidget {
  const BindingFormatForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.background,
      child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Formato de vinculacion', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 20),
          FormSectionHeader(number: 1, title: 'Documentos requeridos', child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Adjunta los documentos para completar el proceso:', style: AppTextStyles.label.copyWith(height: 1.6)),
            const SizedBox(height: 16),
            _DocTile(title: 'RUT', subtitle: 'PDF o imagen, max. 5MB', icon: Icons.receipt_long_outlined),
            const SizedBox(height: 10),
            _DocTile(title: 'Certificado de existencia', subtitle: 'PDF o imagen, max. 5MB', icon: Icons.verified_outlined),
            const SizedBox(height: 10),
            _DocTile(title: 'Documento de identidad del representante', subtitle: 'PDF o imagen, max. 5MB', icon: Icons.badge_outlined),
            const SizedBox(height: 10),
            _DocTile(title: 'Estados financieros', subtitle: 'PDF, max. 10MB', icon: Icons.bar_chart_outlined),
          ])),
          const SizedBox(height: 32),
        ])));
  }
}
class _DocTile extends StatefulWidget {
  final String title, subtitle;
  final IconData icon;
  const _DocTile({required this.title, required this.subtitle, required this.icon});
  @override
  State<_DocTile> createState() => _DocTileState();
}
class _DocTileState extends State<_DocTile> {
  bool _up = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => setState(() => _up = !_up),
      child: AnimatedContainer(duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(color: _up ? AppColors.orange.withOpacity(0.06) : AppColors.background, borderRadius: BorderRadius.circular(10), border: Border.all(color: _up ? AppColors.orange.withOpacity(0.4) : AppColors.border, width: _up ? 1.5 : 1)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(children: [
          Container(width: 40, height: 40, decoration: BoxDecoration(color: _up ? AppColors.iconBg : AppColors.progressBg, borderRadius: BorderRadius.circular(10)), child: Icon(widget.icon, color: _up ? AppColors.orange : AppColors.textLight, size: 20)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.title, style: AppTextStyles.menuTitle),
            Text(_up ? 'Archivo cargado' : widget.subtitle, style: AppTextStyles.menuSubtitle.copyWith(color: _up ? AppColors.orange : AppColors.textLight)),
          ])),
          Icon(_up ? Icons.check_circle : Icons.upload_file_outlined, color: _up ? AppColors.orange : AppColors.textLight, size: 22),
        ])));
  }
}
