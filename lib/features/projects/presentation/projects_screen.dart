import 'package:flutter/material.dart';
import 'package:flutter_portfolio_app/shared/models/project_model.dart';
import 'package:flutter_portfolio_app/shared/widgets/project_card.dart';
import 'package:flutter_portfolio_app/shared/widgets/section_title.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  List<Widget> _rows(List<Project> projects, {bool compact = false}) {
    return [
      for (var i = 0; i < projects.length; i++) ...[
        ProjectCard(project: projects[i], index: i, compact: compact),
        if (i < projects.length - 1) const Divider(),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    final featured = sampleProjects.where((p) => p.isFeatured).toList();
    final others = sampleProjects.where((p) => !p.isFeatured).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                page: true,
                title: 'Projects',
                subtitle: 'Apps I have built and shipped. Tap one for the details.',
              ),
              const SubHeading('Featured'),
              const Divider(),
              ..._rows(featured),
              if (others.isNotEmpty) ...[
                const SizedBox(height: 28),
                const SubHeading('Also built'),
                const Divider(),
                ..._rows(others, compact: true),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
