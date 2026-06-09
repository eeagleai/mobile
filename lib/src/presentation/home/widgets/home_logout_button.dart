import 'package:eeagle_ai/src/presentation/ui/components/eeagle_app_loader.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class HomeLogoutButton extends StatelessWidget {
  const HomeLogoutButton({
    super.key,
    required this.isLoading,
    required this.onTap,
  });

  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return TextButton(
      onPressed: isLoading ? null : onTap,
      style: TextButton.styleFrom(
        foregroundColor: colors.bodyText,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: isLoading
          ? const EeagleAppLoader(size: 18)
          : EeagleText(
              'Log out',
              style: EeagleTextStyles.bodyMedium.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: colors.bodyText,
              ),
              textColor: colors.bodyText,
            ),
    );
  }
}
