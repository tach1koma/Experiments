import 'package:flutter/material.dart';
enum SectionStatus { notStarted, inProgress, completed }
class FormSection {
  final String title;
  final String iconKey;
  final SectionStatus status;
  const FormSection({required this.title, required this.iconKey, required this.status});
  FormSection copyWith({SectionStatus? status}) => FormSection(title: title, iconKey: iconKey, status: status ?? this.status);
  String get statusLabel { switch (status) { case SectionStatus.notStarted: return 'Sin iniciar'; case SectionStatus.inProgress: return 'En proceso'; case SectionStatus.completed: return 'Completado'; } }
  Color get statusColor { switch (status) { case SectionStatus.notStarted: return const Color(0xFF8E8E93); case SectionStatus.inProgress: return const Color(0xFFD4824A); case SectionStatus.completed: return const Color(0xFF34C759); } }
  IconData get icon { switch (iconKey) { case 'general': return Icons.article_outlined; case 'financial': return Icons.account_balance_wallet_outlined; case 'legal_reps': return Icons.person_outline; case 'declarations': return Icons.description_outlined; case 'binding': return Icons.link_outlined; default: return Icons.article_outlined; } }
}
final List<FormSection> defaultFormSections = [
  const FormSection(title: 'Informacion general', iconKey: 'general', status: SectionStatus.inProgress),
  const FormSection(title: 'Informacion financiera', iconKey: 'financial', status: SectionStatus.notStarted),
  const FormSection(title: 'Representantes legales', iconKey: 'legal_reps', status: SectionStatus.notStarted),
  const FormSection(title: 'Declaraciones legales', iconKey: 'declarations', status: SectionStatus.notStarted),
  const FormSection(title: 'Formato de vinculacion', iconKey: 'binding', status: SectionStatus.notStarted),
];
