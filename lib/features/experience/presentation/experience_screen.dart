import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio_app/shared/models/experience_model.dart';
import 'package:flutter_portfolio_app/shared/widgets/section_title.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final work = sampleExperiences.where((e) => !e.isEducation).toList();
    final education = sampleExperiences.where((e) => e.isEducation).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: 'Experience',
                subtitle: 'My professional journey',
              ),
              ...work.asMap().entries.map((entry) {
                return _ExperienceCard(
                  experience: entry.value,
                  index: entry.key,
                  isLast: entry.key == work.length - 1,
                );
              }),
              const SizedBox(height: 32),
              const SectionTitle(
                title: 'Education',
                subtitle: 'Academic background',
              ),
              ...education.asMap().entries.map((entry) {
                return _ExperienceCard(
                  experience: entry.value,
                  index: entry.key,
                  isLast: entry.key == education.length - 1,
                );
              }),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final Experience experience;
  final int index;
  final bool isLast;

  const _ExperienceCard({
    required this.experience,
    required this.index,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: experience.isCurrent
                      ? theme.colorScheme.primary
                      : theme.colorScheme.primary.withOpacity(0.4),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 3,
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: theme.colorScheme.primary.withOpacity(0.3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    experience.company,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${experience.startDate} — ${experience.endDate ?? 'Present'}  •  ${experience.location}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    experience.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...experience.responsibilities.map(
                    (resp) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '•  ',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              resp,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.4,
                                color: theme.colorScheme.onSurface
                                    .withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
        .animate(delay: (120 * index).ms)
        .fadeIn(duration: 400.ms)
        .slideX(begin: 0.08);
  }
}
