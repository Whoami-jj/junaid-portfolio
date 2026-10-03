import 'package:flutter/material.dart';
import 'package:flutter_portfolio_app/shared/models/skill_model.dart';
import 'package:flutter_portfolio_app/shared/widgets/section_title.dart';

enum _Tier { daily, confident, working }

_Tier _tierOf(Skill s) {
  if (s.level >= 0.9) return _Tier.daily;
  if (s.level >= 0.8) return _Tier.confident;
  return _Tier.working;
}

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = sampleSkills.map((s) => s.category).toSet().toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                page: true,
                title: 'Skills',
                subtitle: 'What I reach for, grouped by how much I lean on it.',
              ),
              const Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _SkillChip(label: 'Daily driver', tier: _Tier.daily),
                  _SkillChip(label: 'Confident', tier: _Tier.confident),
                  _SkillChip(label: 'Working knowledge', tier: _Tier.working),
                ],
              ),
              const SizedBox(height: 32),
              for (final category in categories) ...[
                Text(category, style: theme.textTheme.titleLarge),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final s in (sampleSkills
                            .where((s) => s.category == category)
                            .toList()
                          ..sort((a, b) => b.level.compareTo(a.level))))
                      _SkillChip(label: s.name, tier: _tierOf(s)),
                  ],
                ),
                const SizedBox(height: 28),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  final _Tier tier;

  const _SkillChip({required this.label, required this.tier});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = theme.colorScheme;

    late final Color fill;
    late final Color text;
    late final Border? border;
    late final FontWeight weight;

    switch (tier) {
      case _Tier.daily:
        fill = c.primary;
        text = c.onPrimary;
        border = null;
        weight = FontWeight.w700;
        break;
      case _Tier.confident:
        fill = Colors.transparent;
        text = c.onSurface;
        border = Border.all(color: c.primary, width: 1.5);
        weight = FontWeight.w600;
        break;
      case _Tier.working:
        fill = Colors.transparent;
        text = c.onSurfaceVariant;
        border = Border.all(color: c.outlineVariant);
        weight = FontWeight.w500;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: fill,
        border: border,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: text,
          fontWeight: weight,
        ),
      ),
    );
  }
}
