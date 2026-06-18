import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../shared/custom_text_field.dart';
import '../shared/custom_dropdown_field.dart';
import '../shared/form_section_header.dart';
class GeneralInfoForm extends StatelessWidget {
  const GeneralInfoForm({super.key});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width >= 768;
    return Container(color: AppColors.background,
      child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Informacion general', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 20),
          FormSectionHeader(number: 1, title: 'Datos generales de la empresa', child: Column(children: [
            _R(w, const CustomTextField(label: 'Razon social o nombre', placeholder: 'Ingresa el nombre'),
                const CustomDropdownField(label: 'Tipo de identificacion', placeholder: 'Selecciona', options: ['NIT', 'Cedula', 'Pasaporte'])),
            _R(w, const CustomTextField(label: 'Numero de identificacion', placeholder: 'Ingresa el numero', keyboardType: TextInputType.number),
                const CustomDropdownField(label: 'Pais', placeholder: 'Selecciona el pais', options: ['Colombia', 'Mexico', 'Argentina', 'Peru', 'Chile'])),
            _R(w, const CustomDropdownField(label: 'Departamento', placeholder: 'Selecciona', options: ['Antioquia', 'Cundinamarca', 'Valle del Cauca', 'Atlantico']),
                const CustomDropdownField(label: 'Ciudad', placeholder: 'Selecciona', options: ['Medellin', 'Bogota', 'Cali', 'Barranquilla'])),
            _R(w, const CustomTextField(label: 'Direccion', placeholder: 'Ingresa la direccion'),
                const CustomTextField(label: 'Telefono fijo', placeholder: 'Ingresa el telefono', keyboardType: TextInputType.phone)),
            _R(w, const CustomTextField(label: 'Celular', placeholder: 'Ingresa el celular', keyboardType: TextInputType.phone),
                const CustomTextField(label: 'Correo electronico', placeholder: 'Ingresa el correo', keyboardType: TextInputType.emailAddress)),
            _R(w, const CustomTextField(label: 'Codigo postal', placeholder: 'Ingresa el codigo', hasInfoIcon: true, keyboardType: TextInputType.number),
                const CustomTextField(label: 'Codigo CIIU', placeholder: '0000', hasInfoIcon: true, initialValue: '0000', keyboardType: TextInputType.number)),
          ])),
          const SizedBox(height: 32),
        ])));
  }
}
Widget _R(bool w, Widget l, Widget r) => Padding(padding: const EdgeInsets.only(bottom: 16),
  child: w ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: l), const SizedBox(width: 16), Expanded(child: r)])
           : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [l, const SizedBox(height: 16), r]));
