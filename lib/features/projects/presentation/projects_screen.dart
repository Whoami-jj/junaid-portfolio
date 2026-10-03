import 'package:flutter/material.dart';
import 'package:flutter_portfolio_app/shared/models/project_model.dart';
import 'package:flutter_portfolio_app/shared/widgets/project_card.dart';
import 'package:flutter_portfolio_app/shared/widgets/section_title.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              sliver: SliverToBoxAdapter(
                child: const SectionTitle(
                  title: 'Projects',
                  subtitle: 'Some of the work I\'m proud of',
                ),
              ),
            ),
            // Featured Projects
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final featured = sampleProjects
                        .where((p) => p.isFeatured)
                        .toList();
                    if (index >= featured.length) return null;
                    return ProjectCard(
                      project: featured[index],
                      index: index,
                    );
                  },
                  childCount:
                      sampleProjects.where((p) => p.isFeatured).length,
                ),
              ),
            ),
            // Other Projects
            if (sampleProjects.any((p) => !p.isFeatured)) ...[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Other Projects',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final others = sampleProjects
                          .where((p) => !p.isFeatured)
                          .toList();
                      if (index >= others.length) return null;
                      return ProjectCard(
                        project: others[index],
                        index: index + 3,
                      );
                    },
                    childCount:
                        sampleProjects.where((p) => !p.isFeatured).length,
                  ),
                ),
              ),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}
