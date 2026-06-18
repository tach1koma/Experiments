import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../shared/custom_text_field.dart';
import '../shared/custom_dropdown_field.dart';
import '../shared/form_section_header.dart';
class LegalRepsForm extends StatefulWidget {
  const LegalRepsForm({super.key});
  @override
  State<LegalRepsForm> createState() => _LegalRepsFormState();
}
class _LegalRepsFormState extends State<LegalRepsForm> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width >= 768;
    return Container(color: AppColors.background,
      child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Representantes legales', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 20),
          ...List.generate(_count, (i) => Padding(padding: const EdgeInsets.only(bottom: 16),
            child: FormSectionHeader(number: i + 1, title: 'Representante legal${_count > 1 ? ' ${i+1}' : ''}', child: Column(children: [
              _R(w, const CustomTextField(label: 'Nombre completo', placeholder: 'Nombre'),
                  const CustomDropdownField(label: 'Tipo de ID', placeholder: 'Selecciona', options: ['Cedula', 'Pasaporte', 'Cedula extranjeria'])),
              _R(w, const CustomTextField(label: 'Numero de ID', placeholder: 'Numero', keyboardType: TextInputType.number),
                  const CustomTextField(label: 'Cargo', placeholder: 'Cargo')),
            ])))),
          GestureDetector(onTap: () => setState(() => _count++),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(width: 28, height: 28, decoration: BoxDecoration(border: Border.all(color: AppColors.orange), borderRadius: BorderRadius.circular(14)),
                child: const Icon(Icons.add, color: AppColors.orange, size: 18)),
              const SizedBox(width: 10),
              Text('Agregar representante', style: AppTextStyles.label.copyWith(color: AppColors.orange)),
            ])),
          const SizedBox(height: 32),
        ])));
  }
}
Widget _R(bool w, Widget l, Widget r) => Padding(padding: const EdgeInsets.only(bottom: 16),
  child: w ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: l), const SizedBox(width: 16), Expanded(child: r)])
           : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [l, const SizedBox(height: 16), r]));
