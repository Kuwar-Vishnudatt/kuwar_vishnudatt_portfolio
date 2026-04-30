import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// Top navigation bar with neon accent links and a glowing logo.
class PortfolioNavBar extends StatelessWidget {
  final List<String> sections;
  final int currentSection;
  final void Function(int) onNavTap;

  const PortfolioNavBar({
    Key? key,
    required this.sections,
    required this.currentSection,
    required this.onNavTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppTheme.bgDark.withOpacity(0.92),
        border: Border(
          bottom: BorderSide(
            color: AppTheme.neonCyan.withOpacity(0.15),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.neonCyan.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '< ',
                  style: AppTheme.labelStyle.copyWith(
                    color: AppTheme.neonMagenta,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'DEV',
                  style: AppTheme.displaySmall.copyWith(
                    fontSize: 18,
                    color: AppTheme.textPrimary,
                  ),
                ),
                TextSpan(
                  text: '.portfolio',
                  style: AppTheme.labelStyle.copyWith(
                    color: AppTheme.neonCyan,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: ' />',
                  style: AppTheme.labelStyle.copyWith(
                    color: AppTheme.neonMagenta,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Nav links (hidden on mobile)
          if (!isMobile)
            Row(
              children: sections.asMap().entries.map((entry) {
                final i = entry.key;
                final s = entry.value;
                final isActive = currentSection == i;
                return _NavLink(
                  label: s,
                  isActive: isActive,
                  onTap: () => onNavTap(i),
                );
              }).toList(),
            ),

          // Mobile hamburger placeholder
          if (isMobile)
            Icon(Icons.menu, color: AppTheme.neonCyan.withOpacity(0.7)),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final color =
        widget.isActive || _hovered ? AppTheme.neonCyan : AppTheme.textDim;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(left: 32),
          padding: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.isActive ? AppTheme.neonCyan : Colors.transparent,
                width: 1.5,
              ),
            ),
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppTheme.labelStyle.copyWith(
              color: color,
              fontSize: 12,
              shadows: widget.isActive || _hovered
                  ? [
                      Shadow(
                        color: AppTheme.neonCyan.withOpacity(0.6),
                        blurRadius: 8,
                      )
                    ]
                  : [],
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
