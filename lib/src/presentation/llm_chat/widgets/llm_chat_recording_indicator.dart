import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_svg_icon.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class LlmChatListeningBanner extends StatelessWidget {
  const LlmChatListeningBanner({
    super.key,
    required this.soundLevel,
  });

  final double soundLevel;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colors.palette.primary.shade900.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: colors.palette.primary.shade500.withValues(alpha: 0.45),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _VoiceReactiveRecordDot(size: 8, soundLevel: soundLevel),
          const SizedBox(width: 10),
          EeagleText(
            'Listening',
            style: EeagleTextStyles.bodySmall,
            textColor: colors.titleNatural,
          ),
          const SizedBox(width: 12),
          LlmChatRecordingWaveform(
            color: colors.palette.primary.shade400,
            soundLevel: soundLevel,
          ),
        ],
      ),
    );
  }
}

class LlmChatRecordingMicButton extends StatelessWidget {
  const LlmChatRecordingMicButton({
    super.key,
    required this.isListening,
    required this.soundLevel,
    required this.onTap,
    this.enabled = true,
    this.size = 34,
  });

  final bool isListening;
  final double soundLevel;
  final VoidCallback? onTap;
  final bool enabled;
  final double size;

  static const _animationDuration = Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final accent = colors.palette.primary.shade500;
    final level = isListening ? soundLevel.clamp(0.0, 1.0) : 0.0;

    final outerScale = 1 + (level * 0.55);
    final innerScale = 1 + (level * 0.35);
    final outerOpacity = 0.12 + (level * 0.4);
    final innerOpacity = 0.08 + (level * 0.28);
    final innerSize = size * 0.82;

    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            if (isListening) ...[
              AnimatedScale(
                scale: outerScale,
                duration: _animationDuration,
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: outerOpacity,
                  duration: _animationDuration,
                  curve: Curves.easeOut,
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: accent,
                    ),
                  ),
                ),
              ),
              AnimatedScale(
                scale: innerScale,
                duration: _animationDuration,
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: innerOpacity,
                  duration: _animationDuration,
                  curve: Curves.easeOut,
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: accent,
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: _animationDuration,
                curve: Curves.easeOut,
                width: innerSize,
                height: innerSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent.withValues(alpha: 0.12 + (level * 0.18)),
                  border: Border.all(
                    color: accent.withValues(alpha: 0.45 + (level * 0.45)),
                  ),
                ),
              ),
            ],
            EeagleSvgIcon(
              icon: Assets.icons.home.icMic,
              size: size * 0.53,
            ),
          ],
        ),
      ),
    );
  }
}

class LlmChatRecordingWaveform extends StatelessWidget {
  const LlmChatRecordingWaveform({
    super.key,
    required this.color,
    required this.soundLevel,
    this.barCount = 4,
  });

  final Color color;
  final double soundLevel;
  final int barCount;

  static const _barFactors = [0.85, 1.0, 0.75, 0.95];
  static const _animationDuration = Duration(milliseconds: 80);

  @override
  Widget build(BuildContext context) {
    final level = soundLevel.clamp(0.0, 1.0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(barCount, (index) {
        final factor = _barFactors[index % _barFactors.length];
        final height = 4 + (level * 14 * factor);

        return AnimatedContainer(
          duration: _animationDuration,
          curve: Curves.easeOut,
          width: 3,
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 1.5),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.45 + (level * 0.55)),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}

class _VoiceReactiveRecordDot extends StatelessWidget {
  const _VoiceReactiveRecordDot({
    required this.size,
    required this.soundLevel,
  });

  final double size;
  final double soundLevel;

  static const _animationDuration = Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final level = soundLevel.clamp(0.0, 1.0);
    final dotSize = size + (level * 2);
    final opacity = 0.35 + (level * 0.65);
    final blurRadius = 4 + (level * 6);

    return AnimatedContainer(
      duration: _animationDuration,
      curve: Curves.easeOut,
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.error.withValues(alpha: opacity),
        boxShadow: [
          BoxShadow(
            color: colors.error.withValues(alpha: 0.2 + (level * 0.35)),
            blurRadius: blurRadius,
            spreadRadius: level,
          ),
        ],
      ),
    );
  }
}
