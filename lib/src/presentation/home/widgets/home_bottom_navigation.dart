import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.onCreate,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Container(
        height: 78,
        decoration: BoxDecoration(
          color: const Color(0xF20D1524),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colors.chipBorder),
          boxShadow: const [
            BoxShadow(
              color: Color(0x66000000),
              blurRadius: 24,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: _NavigationItem(
                icon: Icons.home_rounded,
                label: 'Home',
                selected: selectedIndex == 0,
                onTap: () => onSelected(0),
              ),
            ),
            Expanded(
              child: _NavigationItem(
                icon: Icons.folder_outlined,
                label: 'Projects',
                selected: selectedIndex == 1,
                onTap: () => onSelected(1),
              ),
            ),
            Expanded(
              child: Center(
                child: Semantics(
                  button: true,
                  label: 'Create website',
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onCreate,
                      customBorder: const CircleBorder(),
                      child: Ink(
                        width: 62,
                        height: 62,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF246BFD), Color(0xFF7A3CF0)],
                          ),
                          border: Border.all(color: const Color(0xFF7BA3FF)),
                          boxShadow: const [
                            BoxShadow(color: Color(0x662A63FF), blurRadius: 20),
                          ],
                        ),
                        child: Image.asset(Assets.icons.eegaleIc.path),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _NavigationItem(
                icon: Icons.bar_chart_rounded,
                label: 'Analytics',
                selected: selectedIndex == 2,
                onTap: () => onSelected(2),
              ),
            ),
            Expanded(
              child: _NavigationItem(
                icon: Icons.settings_outlined,
                label: 'Settings',
                selected: selectedIndex == 3,
                onTap: () => onSelected(3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final color = selected ? const Color(0xFF5D82FF) : colors.bodyText;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            maxLines: 1,
            style: EeagleTextStyles.bodySmall.copyWith(
              color: color,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
