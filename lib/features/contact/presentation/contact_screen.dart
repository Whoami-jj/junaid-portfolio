import 'package:flutter/material.dart';
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
    final muted = theme.colorScheme.onSurfaceVariant;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(page: true, title: 'Contact'),
              Text(
                'Have an app in mind?',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'I am open to new roles, freelance projects and interesting collaborations. A short note is enough to start.',
                style: theme.textTheme.bodyLarge?.copyWith(color: muted),
              ),
              const SizedBox(height: 28),
              const Divider(),
              _ContactRow(
                icon: Icons.mail_outline_rounded,
                label: 'Email',
                value: AppConstants.email,
                onTap: () => _launchUrl('mailto:${AppConstants.email}'),
              ),
              _ContactRow(
                icon: Icons.phone_outlined,
                label: 'Phone',
                value: AppConstants.phone,
                onTap: () =>
                    _launchUrl('tel:${AppConstants.phone.replaceAll(' ', '')}'),
              ),
              _ContactRow(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                value: 'github.com/${AppConstants.githubUsername}',
                onTap: () => _launchUrl(AppConstants.githubUrl),
              ),
              _ContactRow(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                value: 'Junaid Akram',
                onTap: () => _launchUrl(AppConstants.linkedinUrl),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => _launchUrl(
                    'mailto:${AppConstants.email}?subject=Hello from your portfolio',
                  ),
                  icon: const Icon(Icons.send_rounded, size: 18),
                  label: const Text('Send an email'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = theme.colorScheme;

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: c.outlineVariant),
                  ),
                  child: FaIcon(icon, size: 18, color: c.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: c.onSurfaceVariant),
                      ),
                      Text(
                        value,
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.north_east_rounded, size: 20, color: c.onSurfaceVariant),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
