import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

/// Animated glowing skill progress bar.
class SkillBar extends StatefulWidget {
  final SkillModel skill;
  final bool animate;

  const SkillBar({Key? key, required this.skill, this.animate = true})
      : super(key: key);

  @override
  State<SkillBar> createState() => _SkillBarState();
}

class _SkillBarState extends State<SkillBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _widthAnim;
  bool _hovered = false;

  // Color per category
  Color get _color {
    switch (widget.skill.category) {
      case 'Mobile':
        return AppTheme.neonCyan;
      case 'Backend':
        return AppTheme.neonPurple;
      case 'Language':
        return AppTheme.neonMagenta;
      case 'State Mgmt':
        return AppTheme.neonGreen;
      default:
        return AppTheme.neonBlue;
    }
  }

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _widthAnim = Tween<double>(begin: 0, end: widget.skill.proficiency)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    if (widget.animate) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) _ctrl.forward();
      });
    } else {
      _ctrl.value = 1;
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedBuilder(
        animation: _widthAnim,
        builder: (_, __) {
          final pct = (_widthAnim.value * 100).round();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _color,
                          boxShadow: [
                            BoxShadow(
                              color: _color.withOpacity(0.6),
                              blurRadius: 6,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.skill.name,
                        style: AppTheme.bodyMedium.copyWith(
                          color: _hovered
                              ? AppTheme.textPrimary
                              : AppTheme.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$pct%',
                    style: AppTheme.labelStyle.copyWith(
                      color: _color,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Track
              Container(
                height: 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _widthAnim.value,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [_color.withOpacity(0.6), _color],
                      ),
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: _color.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Glowing skill chip — compact tag style.
class SkillChip extends StatefulWidget {
  final String label;
  final Color color;

  const SkillChip({Key? key, required this.label, required this.color})
      : super(key: key);

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: widget.color.withOpacity(_hovered ? 0.15 : 0.06),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: widget.color.withOpacity(_hovered ? 0.7 : 0.25),
            width: 1,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: Text(
          widget.label,
          style: AppTheme.chipStyle.copyWith(
            color: widget.color.withOpacity(_hovered ? 1.0 : 0.7),
          ),
        ),
      ),
    );
  }
}
