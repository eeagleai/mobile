import 'package:eeagle_ai/src/presentation/ui/components/eeagle_app_loader.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class HomeSettingsView extends StatelessWidget {
  const HomeSettingsView({
    super.key,
    required this.initials,
    required this.isLoggingOut,
    required this.onLogout,
  });

  final String initials;
  final bool isLoggingOut;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 116),
      children: [
        EeagleText(
          'Settings',
          style: EeagleTextStyles.headlineLarge,
          textColor: colors.titleNatural,
        ),
        const SizedBox(height: 6),
        EeagleText(
          'Manage your account and app preferences.',
          style: EeagleTextStyles.bodyMedium,
          textColor: colors.bodyText,
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xB3131E31),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: colors.chipBorder),
          ),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2763D8), Color(0xFF6B2E91)],
                  ),
                  border: Border.all(color: const Color(0xFF688CF4)),
                ),
                child: EeagleText(
                  initials,
                  style: EeagleTextStyles.titleMedium,
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EeagleText(
                      'eeagle.ai account',
                      style: EeagleTextStyles.titleMedium,
                      textColor: colors.titleNatural,
                    ),
                    const SizedBox(height: 3),
                    EeagleText(
                      'Your websites and analytics are connected.',
                      style: EeagleTextStyles.bodySmall,
                      textColor: colors.bodyText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xB3131E31),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: colors.chipBorder),
          ),
          child: Column(
            children: [
              _SettingsInfoRow(
                icon: Icons.notifications_outlined,
                title: 'Push notifications',
                subtitle: 'Website and conversation updates',
              ),
              Divider(height: 1, color: colors.chipBorder),
              const _SettingsInfoRow(
                icon: Icons.dark_mode_outlined,
                title: 'Appearance',
                subtitle: 'Dark mode',
              ),
              Divider(height: 1, color: colors.chipBorder),
              const _SettingsInfoRow(
                icon: Icons.info_outline_rounded,
                title: 'About',
                subtitle: 'eeagle.ai mobile app',
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 48,
          child: OutlinedButton.icon(
            onPressed: isLoggingOut ? null : onLogout,
            style: OutlinedButton.styleFrom(
              foregroundColor: colors.error,
              side: BorderSide(color: colors.error.withValues(alpha: 0.7)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: isLoggingOut
                ? EeagleAppLoader(size: 20, color: colors.error)
                : const Icon(Icons.logout_rounded),
            label: const Text('Sign out'),
          ),
        ),
      ],
    );
  }
}

class _SettingsInfoRow extends StatelessWidget {
  const _SettingsInfoRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 22, color: const Color(0xFF6C8EFF)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EeagleText(
                  title,
                  style: EeagleTextStyles.titleSmall,
                  textColor: colors.titleNatural,
                ),
                const SizedBox(height: 2),
                EeagleText(
                  subtitle,
                  style: EeagleTextStyles.bodySmall,
                  textColor: colors.bodyText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
