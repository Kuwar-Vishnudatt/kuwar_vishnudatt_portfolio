import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// Reusable section heading with a glowing accent underline and label prefix.
class SectionTitle extends StatelessWidget {
  final String label; // e.g. '// 01'
  final String title;
  final Color accentColor;

  const SectionTitle({
    Key? key,
    required this.label,
    required this.title,
    this.accentColor = AppTheme.neonCyan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleSize = Responsive.sectionTitleSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Comment-style label above title
        Text(
          label,
          style: AppTheme.labelStyle.copyWith(color: accentColor),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTheme.displaySmall.copyWith(fontSize: titleSize),
        ),
        const SizedBox(height: 12),
        // Glowing underline bar
        Container(
          height: 2,
          width: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accentColor, accentColor.withOpacity(0)],
            ),
            boxShadow: [
              BoxShadow(
                color: accentColor.withOpacity(0.6),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Glassmorphism container card.
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color borderColor;
  final double borderRadius;
  final List<BoxShadow>? glow;

  const GlassCard({
    Key? key,
    required this.child,
    this.padding,
    this.borderColor = AppTheme.neonCyan,
    this.borderRadius = 12,
    this.glow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor.withOpacity(0.25),
          width: 1,
        ),
        boxShadow: glow ??
            [
              BoxShadow(
                color: borderColor.withOpacity(0.08),
                blurRadius: 30,
                spreadRadius: 2,
              ),
            ],
      ),
      child: child,
    );
  }
}

/// Animated fade + slide in widget on first build.
class FadeSlideIn extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Offset beginOffset;

  const FadeSlideIn({
    Key? key,
    required this.child,
    this.delay = Duration.zero,
    this.beginOffset = const Offset(0, 30),
  }) : super(key: key);

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, child) => Opacity(
        opacity: _fade.value,
        child: Transform.translate(
          offset: _slide.value,
          child: child,
        ),
      ),
      child: widget.child,
    );
  }
}
