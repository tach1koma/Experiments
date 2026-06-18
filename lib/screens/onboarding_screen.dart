import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/models/form_section.dart';
import '../widgets/top_nav_bar.dart';
import '../widgets/side_menu/menu_panel.dart';
import '../widgets/forms/general_info_form.dart';
import '../widgets/forms/financial_info_form.dart';
import '../widgets/forms/legal_reps_form.dart';
import '../widgets/forms/legal_declarations_form.dart';
import '../widgets/forms/binding_format_form.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  int _idx = 0;
  bool _showMenu = true;
  List<FormSection> _sections = List.from(defaultFormSections);
  double get _progress => _sections.where((s) => s.status == SectionStatus.completed).length / _sections.length;
  void _select(int i) {
    setState(() {
      _idx = i; _showMenu = false;
      if (_sections[i].status == SectionStatus.notStarted) {
        _sections = List.from(_sections);
        _sections[i] = _sections[i].copyWith(status: SectionStatus.inProgress);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(children: [
        TopNavBar(showBackArrow: !_showMenu, onBack: _showMenu ? null : () => setState(() => _showMenu = true)),
        Expanded(child: LayoutBuilder(builder: (ctx, c) {
          if (c.maxWidth >= 768) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(width: 320, child: MenuPanel(selectedIndex: _idx, sections: _sections, onSectionSelected: _select, progress: _progress)),
              const VerticalDivider(width: 1, color: Color(0xFFE5D5C3)),
              Expanded(child: _form()),
            ]);
          }
          return _showMenu
            ? MenuPanel(selectedIndex: _idx, sections: _sections, onSectionSelected: _select, isMobile: true, progress: _progress)
            : _form();
        })),
      ]),
    );
  }
  Widget _form() => IndexedStack(index: _idx, children: const [
    GeneralInfoForm(), FinancialInfoForm(), LegalRepsForm(), LegalDeclarationsForm(), BindingFormatForm(),
  ]);
}
