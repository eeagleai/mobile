import 'package:eeagle_ai/src/presentation/ui/components/eeagle_primary_button.dart';
import 'package:flutter/material.dart';

class LoginPrimaryButton extends StatelessWidget {
  const LoginPrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return EeaglePrimaryButton(
      label: label,
      onTap: onTap,
      isLoading: isLoading,
    );
  }
}
