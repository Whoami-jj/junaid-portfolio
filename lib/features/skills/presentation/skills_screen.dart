import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio_app/shared/models/skill_model.dart';
import 'package:flutter_portfolio_app/shared/widgets/section_title.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = sampleSkills.map((s) => s.category).toSet().toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: 'Skills',
                subtitle: 'Technologies I work with',
              ),
              ...categories.map((category) {
                final skillsInCategory =
                    sampleSkills.where((s) => s.category == category).toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...skillsInCategory.asMap().entries.map((entry) {
                      final index = entry.key;
                      final skill = entry.value;
                      return _SkillBar(
                        skill: skill,
                        index: index,
                      );
                    }),
                    const SizedBox(height: 28),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final Skill skill;
  final int index;

  const _SkillBar({
    required this.skill,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill.name,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${(skill.level * 100).toInt()}%',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: skill.level,
              minHeight: 10,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    )
        .animate(delay: (80 * index).ms)
        .fadeIn(duration: 400.ms)
        .slideX(begin: 0.05);
  }
}
