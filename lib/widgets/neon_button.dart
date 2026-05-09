import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A glowing neon button with hover scale and glow animation.
class NeonButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final bool outlined;
  final IconData? icon;

  const NeonButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = AppTheme.neonCyan,
    this.outlined = false,
    this.icon,
  }) : super(key: key);

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnim;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _glowAnim = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedBuilder(
          animation: _glowAnim,
          builder: (_, __) {
            final intensity =
                (_hovered ? _glowAnim.value * 1.5 : _glowAnim.value)
                    .clamp(0.0, 1.0);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: Matrix4.identity()..scale(_hovered ? 1.06 : 1.0),
              transformAlignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              decoration: BoxDecoration(
                gradient: widget.outlined
                    ? null
                    : LinearGradient(
                        colors: [
                          widget.color.withOpacity(0.15),
                          widget.color.withOpacity(0.05),
                        ],
                      ),
                border: Border.all(
                  color: widget.color.withOpacity(0.8 * intensity),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withOpacity(0.3 * intensity),
                    blurRadius: 16 * intensity,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: widget.color.withOpacity(0.15 * intensity),
                    blurRadius: 32 * intensity,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    Icon(widget.icon, color: widget.color, size: 16),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    widget.label,
                    style: AppTheme.labelStyle.copyWith(
                      color: widget.color,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
