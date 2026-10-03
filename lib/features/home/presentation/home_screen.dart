import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_portfolio_app/core/constants/app_constants.dart';
import 'package:flutter_portfolio_app/shared/models/project_model.dart';
import 'package:flutter_portfolio_app/shared/widgets/project_card.dart';
import 'package:flutter_portfolio_app/shared/widgets/reveal.dart';
import 'package:flutter_portfolio_app/shared/widgets/section_title.dart';
import 'package:flutter_portfolio_app/shared/widgets/theme_toggle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = theme.colorScheme;
    final parts = AppConstants.name.split(' ');
    final displayName =
    '${parts.first}\n${parts.skip(1).join(' ')}'.trimRight();
    final featured = sampleProjects.where((p) => p.isFeatured).take(3).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 6, 14, 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: c.outlineVariant),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _PulseDot(color: c.secondary),
                        const SizedBox(width: 6),
                        Text('Open to work', style: theme.textTheme.labelMedium),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const ThemeToggleButton(),
                ],
              ),
              const SizedBox(height: 36),
              Reveal(
                order: 0,
                child: Text(displayName, style: theme.textTheme.displayLarge),
              ),
              const SizedBox(height: 16),
              Reveal(
                order: 1,
                child: Text(
                  AppConstants.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: c.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Reveal(
                order: 1,
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 16, color: c.onSurfaceVariant),
                    const SizedBox(width: 4),
                    Text(
                      AppConstants.location,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: c.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Reveal(
                order: 2,
                child: Text(AppConstants.tagline, style: theme.textTheme.bodyLarge),
              ),
              const SizedBox(height: 28),
              Reveal(
                order: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => _launchUrl(AppConstants.resumeUrl),
                        icon: const Icon(Icons.description_outlined, size: 18),
                        label: const Text('Resume'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () =>
                            _launchUrl('mailto:${AppConstants.email}'),
                        icon: const Icon(Icons.mail_outline_rounded, size: 18),
                        label: const Text('Say hello'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  _SocialButton(
                    label: 'GitHub',
                    icon: const FaIcon(FontAwesomeIcons.github),
                    onTap: () => _launchUrl(AppConstants.githubUrl),
                  ),
                  const SizedBox(width: 12),
                  _SocialButton(
                    label: 'LinkedIn',
                    icon: const FaIcon(FontAwesomeIcons.linkedin),
                    onTap: () => _launchUrl(AppConstants.linkedinUrl),
                  ),
                  const SizedBox(width: 12),
                  _SocialButton(
                    label: 'Website',
                    icon: const Icon(Icons.language),
                    onTap: () => _launchUrl(AppConstants.portfolioWebUrl),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Featured apps'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final p in featured)
                    Expanded(
                      child: InkWell(
                        onTap: () => context.go('/projects'),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: Column(
                            children: [
                              ProjectIcon(project: p, size: 64),
                              const SizedBox(height: 8),
                              Text(
                                p.title.replaceFirst('Inspire Uplift ', ''),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 24),
              const SectionTitle(title: 'About'),
              for (final para in AppConstants.aboutLong.trim().split('\n\n'))
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    para.trim(),
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: c.onSurfaceVariant),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;

  const _SocialButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    return Tooltip(
      message: label,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: c.outlineVariant),
            ),
            child: IconTheme(
              data: IconThemeData(size: 18, color: c.onSurface),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}

class _PulseDot extends StatefulWidget {
  final Color color;
  const _PulseDot({required this.color});

  @override
  State<_PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<_PulseDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.of(context).disableAnimations) {
      _controller.stop();
      _controller.value = 0;
    } else if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          return SizedBox(
            width: 20,
            height: 20,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 10 + 10 * t,
                  height: 10 + 10 * t,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color.withValues(alpha: 0.35 * (1 - t)),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration:
                  BoxDecoration(shape: BoxShape.circle, color: widget.color),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}