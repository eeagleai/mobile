import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_app_loader.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_svg_icon.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class EeaglePrimaryButton extends StatelessWidget {
  const EeaglePrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.showLeadingIcon = true,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool showLeadingIcon;
  final bool isLoading;

  static const double _height = 42;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onTap,
          borderRadius: BorderRadius.circular(100),
          child: Ink(
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB),
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: const Alignment(-0.57, -1.89),
                          radius: 4,
                          colors: [
                            Colors.white.withValues(alpha: 0.4),
                            Colors.white.withValues(alpha: 0.0),
                          ],
                          stops: const [0.1004, 0.4675],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    child: isLoading
                        ? const EeagleAppLoader(
                            size: 28,
                            color: Colors.white,
                          )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (showLeadingIcon) ...[
                          Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(2.25),
                            child: EeagleSvgIcon(
                              icon: Assets.icons.login.icArrowRight,
                              size: 13.5,
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                        Text(
                          label,
                          style: EeagleTextStyles.bodyMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
