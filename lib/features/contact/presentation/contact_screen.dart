import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio_app/core/constants/app_constants.dart';
import 'package:flutter_portfolio_app/shared/widgets/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
              const SectionTitle(
                title: 'Get In Touch',
                subtitle: 'Let\'s build something amazing together',
              ),
              Text(
                'I\'m currently open to new opportunities, freelance projects, and interesting collaborations. Feel free to reach out!',
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                  color: theme.colorScheme.onSurface.withOpacity(0.8),
                ),
              ).animate().fadeIn(),

              const SizedBox(height: 32),

              // Contact Cards
              _ContactCard(
                icon: Icons.email_outlined,
                title: 'Email',
                subtitle: AppConstants.email,
                onTap: () => _launchUrl('mailto:${AppConstants.email}'),
                index: 0,
              ),
              _ContactCard(
                icon: Icons.phone_outlined,
                title: 'Phone',
                subtitle: AppConstants.phone,
                onTap: () => _launchUrl('tel:${AppConstants.phone}'),
                index: 1,
              ),
              _ContactCard(
                icon: FontAwesomeIcons.github,
                title: 'GitHub',
                subtitle: 'github.com/${AppConstants.githubUsername}',
                onTap: () => _launchUrl(AppConstants.githubUrl),
                index: 2,
              ),
              _ContactCard(
                icon: FontAwesomeIcons.linkedin,
                title: 'LinkedIn',
                subtitle: 'Connect with me',
                onTap: () => _launchUrl(AppConstants.linkedinUrl),
                index: 3,
              ),

              const SizedBox(height: 40),

              // CTA
              Center(
                child: Column(
                  children: [
                    Text(
                      'Prefer a quick chat?',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () =>
                          _launchUrl('mailto:${AppConstants.email}?subject=Hello from Portfolio App'),
                      icon: const Icon(Icons.send),
                      label: const Text('Send me an Email'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(220, 50),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 500.ms),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final int index;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: theme.colorScheme.primary,
          ),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: theme.colorScheme.onSurface.withOpacity(0.4),
        ),
      ),
    )
        .animate(delay: (100 * index).ms)
        .fadeIn(duration: 400.ms)
        .slideX(begin: 0.1);
  }
}
