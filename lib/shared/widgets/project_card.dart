import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_portfolio_app/core/theme/app_theme.dart';
import 'package:flutter_portfolio_app/shared/models/project_model.dart';

Future<void> _launchUrl(String? url) async {
  if (url == null) return;
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

/// Every project gets an app-icon tile: a squircle with a glyph and its own colour.
class ProjectIcon extends StatelessWidget {
  final Project project;
  final double size;

  const ProjectIcon({super.key, required this.project, this.size = 64});

  static const Map<String, IconData> _glyphs = {
    '1': Icons.storefront_rounded,
    '2': Icons.insights_rounded,
    '3': Icons.live_tv_rounded,
    '4': Icons.forum_rounded,
    '5': Icons.handyman_rounded,
    '6': Icons.restaurant_rounded,
    '7': Icons.shopping_bag_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final i = (int.tryParse(project.id) ?? 1) - 1;
    final tone = AppTheme.tiles[i.abs() % AppTheme.tiles.length];

    return ExcludeSemantics(
      child: Container(
        width: size,
        height: size,
        decoration: ShapeDecoration(
          color: tone.bg,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(size * 0.42),
          ),
        ),
        child: Icon(
          _glyphs[project.id] ?? Icons.phone_iphone_rounded,
          size: size * 0.48,
          color: tone.fg,
        ),
      ),
    );
  }
}

class TechTags extends StatelessWidget {
  final List<String> tags;
  const TechTags(this.tags, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final t in tags)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              t,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}

void showProjectDetails(BuildContext context, Project project) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    constraints: const BoxConstraints(maxWidth: 720),
    builder: (_) => _ProjectSheet(project: project),
  );
}

class _ProjectSheet extends StatelessWidget {
  final Project project;
  const _ProjectSheet({required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ProjectIcon(project: project, size: 56),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(project.title, style: theme.textTheme.titleLarge),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(project.longDescription, style: theme.textTheme.bodyLarge),
            const SizedBox(height: 20),
            TechTags(project.techStack),
            if (project.githubUrl != null || project.demoUrl != null) ...[
              const SizedBox(height: 24),
              Row(
                children: [
                  if (project.githubUrl != null)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _launchUrl(project.githubUrl),
                        icon: const Icon(Icons.code, size: 18),
                        label: const Text('Source'),
                      ),
                    ),
                  if (project.githubUrl != null && project.demoUrl != null)
                    const SizedBox(width: 12),
                  if (project.demoUrl != null)
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => _launchUrl(project.demoUrl),
                        icon: const Icon(Icons.open_in_new, size: 18),
                        label: const Text('Live demo'),
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A list row (no box). Featured projects are larger; [compact] is for the rest.
class ProjectCard extends StatelessWidget {
  final Project project;
  final int index;
  final bool compact;

  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => showProjectDetails(context, project),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: compact ? 16 : 22),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectIcon(project: project, size: compact ? 52 : 68),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontSize: compact ? 18 : 22),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    project.description,
                    maxLines: compact ? 2 : 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (!compact) ...[
                    const SizedBox(height: 12),
                    TechTags(project.techStack.take(4).toList()),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
