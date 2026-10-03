import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_portfolio_app/shared/models/project_model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final int index;

  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
  });

  Future<void> _launchUrl(String? url) async {
    if (url == null) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Optional: show details bottom sheet
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      project.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (project.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Featured',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                project.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: project.techStack
                    .map(
                      (tech) => Chip(
                        label: Text(tech),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  if (project.githubUrl != null)
                    OutlinedButton.icon(
                      onPressed: () => _launchUrl(project.githubUrl),
                      icon: const Icon(Icons.code, size: 18),
                      label: const Text('GitHub'),
                    ),
                  if (project.githubUrl != null && project.demoUrl != null)
                    const SizedBox(width: 12),
                  if (project.demoUrl != null)
                    ElevatedButton.icon(
                      onPressed: () => _launchUrl(project.demoUrl),
                      icon: const Icon(Icons.open_in_new, size: 18),
                      label: const Text('Live Demo'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    )
        .animate(delay: (100 * index).ms)
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.15, end: 0, curve: Curves.easeOut);
  }
}
