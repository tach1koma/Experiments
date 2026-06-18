import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../shared/custom_text_field.dart';
import '../shared/custom_dropdown_field.dart';
import '../shared/form_section_header.dart';
class FinancialInfoForm extends StatelessWidget {
  const FinancialInfoForm({super.key});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width >= 768;
    return Container(color: AppColors.background,
      child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Informacion financiera', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 20),
          FormSectionHeader(number: 1, title: 'Datos financieros', child: Column(children: [
            _R(w, const CustomTextField(label: 'Ingresos anuales', placeholder: 'Valor en pesos', keyboardType: TextInputType.number),
                const CustomTextField(label: 'Patrimonio', placeholder: 'Valor en pesos', keyboardType: TextInputType.number)),
            _R(w, const CustomTextField(label: 'Activos totales', placeholder: 'Valor en pesos', keyboardType: TextInputType.number),
                const CustomTextField(label: 'Pasivos totales', placeholder: 'Valor en pesos', keyboardType: TextInputType.number)),
            _R(w, const CustomDropdownField(label: 'Origen de fondos', placeholder: 'Selecciona', options: ['Actividad comercial', 'Servicios', 'Inversiones', 'Otro']),
                const CustomDropdownField(label: 'Maneja divisas', placeholder: 'Selecciona', options: ['Si', 'No'])),
          ])),
          const SizedBox(height: 32),
        ])));
  }
}
Widget _R(bool w, Widget l, Widget r) => Padding(padding: const EdgeInsets.only(bottom: 16),
  child: w ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: l), const SizedBox(width: 16), Expanded(child: r)])
           : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [l, const SizedBox(height: 16), r]));
