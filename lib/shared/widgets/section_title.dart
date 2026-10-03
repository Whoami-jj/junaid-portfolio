import 'package:flutter/material.dart';
import 'package:flutter_portfolio_app/shared/widgets/theme_toggle.dart';

/// Screen header (page: true, includes the theme toggle) or in-page section heading.
class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool page;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.page = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: EdgeInsets.only(bottom: page ? 24 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: page ? 8 : 0),
                  child: Text(
                    title,
                    style: page
                        ? theme.textTheme.displaySmall
                        : theme.textTheme.headlineSmall,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodyLarge?.copyWith(color: muted),
                  ),
                ],
              ],
            ),
          ),
          if (page) const ThemeToggleButton(),
        ],
      ),
    );
  }
}

class SubHeading extends StatelessWidget {
  final String label;
  const SubHeading(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        label,
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
