import 'package:flutter/material.dart';
import 'package:flutter_portfolio_app/shared/models/experience_model.dart';
import 'package:flutter_portfolio_app/shared/widgets/section_title.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  List<Widget> _entries(List<Experience> items) {
    return [
      for (var i = 0; i < items.length; i++)
        _ExperienceEntry(experience: items[i], isLast: i == items.length - 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final work = sampleExperiences.where((e) => !e.isEducation).toList();
    final education = sampleExperiences.where((e) => e.isEducation).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                page: true,
                title: 'Experience',
                subtitle: 'Where I have worked, newest first.',
              ),
              ..._entries(work),
              const SizedBox(height: 36),
              const SectionTitle(title: 'Education'),
              ..._entries(education),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceEntry extends StatefulWidget {
  final Experience experience;
  final bool isLast;

  const _ExperienceEntry({required this.experience, required this.isLast});

  @override
  State<_ExperienceEntry> createState() => _ExperienceEntryState();
}

class _ExperienceEntryState extends State<_ExperienceEntry> {
  late bool _open = widget.experience.isCurrent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = theme.colorScheme;
    final e = widget.experience;
    final reduce = MediaQuery.of(context).disableAnimations;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            child: Column(
              children: [
                const SizedBox(height: 5),
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: e.isCurrent ? c.secondary : c.surface,
                    border: e.isCurrent
                        ? null
                        : Border.all(color: c.outline, width: 2),
                    boxShadow: e.isCurrent
                        ? [
                            BoxShadow(
                              color: c.secondary.withValues(alpha: 0.28),
                              spreadRadius: 4,
                            ),
                          ]
                        : null,
                  ),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 1,
                      margin: const EdgeInsets.only(top: 8),
                      color: c.outlineVariant,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${e.startDate} to ${e.endDate ?? 'Present'}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: c.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(e.title, style: theme.textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    e.company,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: c.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    e.location,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: c.onSurfaceVariant),
                  ),
                  const SizedBox(height: 12),
                  Text(e.description, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  TextButton.icon(
                    onPressed: () => setState(() => _open = !_open),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 44),
                      alignment: Alignment.centerLeft,
                    ),
                    icon: Icon(
                      _open ? Icons.expand_less : Icons.expand_more,
                      size: 20,
                    ),
                    label: Text(
                      _open
                          ? 'Hide highlights'
                          : 'Show highlights (${e.responsibilities.length})',
                    ),
                  ),
                  AnimatedSize(
                    duration: reduce
                        ? Duration.zero
                        : const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    alignment: Alignment.topCenter,
                    child: _open
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (final r in e.responsibilities)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 9, right: 12),
                                        child: Container(
                                          width: 5,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: c.primary,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          r,
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: c.onSurfaceVariant,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          )
                        : const SizedBox(width: double.infinity),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
