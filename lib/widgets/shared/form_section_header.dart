import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
class FormSectionHeader extends StatefulWidget {
  final int number;
  final String title;
  final bool initiallyExpanded;
  final Widget child;
  const FormSectionHeader({super.key, required this.number, required this.title, this.initiallyExpanded = true, required this.child});
  @override
  State<FormSectionHeader> createState() => _FormSectionHeaderState();
}
class _FormSectionHeaderState extends State<FormSectionHeader> with SingleTickerProviderStateMixin {
  late bool _exp;
  late AnimationController _ctrl;
  late Animation<double> _rot;
  @override
  void initState() {
    super.initState();
    _exp = widget.initiallyExpanded;
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 200), value: _exp ? 1.0 : 0.0);
    _rot = Tween<double>(begin: 0, end: 0.5).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }
  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }
  void _toggle() { setState(() => _exp = !_exp); _exp ? _ctrl.forward() : _ctrl.reverse(); }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.border)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        InkWell(onTap: _toggle, borderRadius: BorderRadius.circular(12),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(children: [
              Container(width: 28, height: 28, decoration: const BoxDecoration(color: AppColors.sectionCircle, shape: BoxShape.circle),
                child: Center(child: Text('${widget.number}', style: const TextStyle(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.w700)))),
              const SizedBox(width: 12),
              Expanded(child: Text(widget.title, style: AppTextStyles.sectionHeader)),
              RotationTransition(turns: _rot, child: const Icon(Icons.remove_circle_outline, color: AppColors.textLight, size: 22)),
            ]))),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: _exp ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(height: 1, color: AppColors.divider, margin: const EdgeInsets.symmetric(horizontal: 16)),
            Padding(padding: const EdgeInsets.fromLTRB(16, 16, 16, 20), child: widget.child),
          ]),
          secondChild: const SizedBox.shrink(),
        ),
      ]),
    );
  }
}
