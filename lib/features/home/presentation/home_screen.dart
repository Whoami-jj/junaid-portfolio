import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio_app/core/constants/app_constants.dart';
import 'package:flutter_portfolio_app/shared/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              Center(
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.primary,
                            theme.colorScheme.secondary,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .scale(begin: const Offset(0.8, 0.8)),

                    const SizedBox(height: 24),

                    // Name
                    Text(
                      AppConstants.name,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),

                    const SizedBox(height: 8),

                    // Title
                    Text(
                      AppConstants.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(delay: 300.ms),

                    const SizedBox(height: 12),

                    // Location
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          AppConstants.location,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: 400.ms),

                    const SizedBox(height: 24),

                    // Bio
                    Text(
                      AppConstants.bio,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                        color: theme.colorScheme.onSurface.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(delay: 500.ms),

                    const SizedBox(height: 28),

                    // Social Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialButton(
                          icon: FontAwesomeIcons.github,
                          onTap: () => _launchUrl(AppConstants.githubUrl),
                        ),
                        const SizedBox(width: 16),
                        _SocialButton(
                          icon: FontAwesomeIcons.linkedin,
                          onTap: () => _launchUrl(AppConstants.linkedinUrl),
                        ),

                        const SizedBox(width: 16),
                        _SocialButton(
                          icon: Icons.language,
                          onTap: () => _launchUrl(AppConstants.portfolioWebUrl),
                        ),
                      ],
                    ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2),

                    const SizedBox(height: 28),

                    // CTA Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _launchUrl(AppConstants.resumeUrl),
                          icon: const Icon(Icons.download),
                          label: const Text('Download Resume'),
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton.icon(
                          onPressed: () => _launchUrl('mailto:${AppConstants.email}'),
                          icon: const Icon(Icons.email_outlined),
                          label: const Text('Contact Me'),
                        ),
                      ],
                    ).animate().fadeIn(delay: 700.ms),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // About Section
              const SectionTitle(
                title: 'About Me',
                subtitle: 'A little more about my journey',
              ),
              Text(
                AppConstants.aboutLong,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.7,
                  color: theme.colorScheme.onSurface.withOpacity(0.8),
                ),
              ).animate().fadeIn(delay: 200.ms),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.primary.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          child: FaIcon(
            icon,
            size: 20,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
