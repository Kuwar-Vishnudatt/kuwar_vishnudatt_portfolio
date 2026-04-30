import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/cyber_background.dart';
import '../widgets/glitch_text.dart';
import '../widgets/neon_button.dart';
import '../widgets/section_title.dart';

/// Hero section — full viewport with animated name, title, and CTA buttons.
class HeroSection extends StatefulWidget {
  final VoidCallback onViewProjects;
  final VoidCallback onContact;

  const HeroSection({
    Key? key,
    required this.onViewProjects,
    required this.onContact,
  }) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  bool _titleDone = false;
  late AnimationController _fadeCtrl;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    super.dispose();
  }

  void _onTitleDone() {
    setState(() => _titleDone = true);
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _fadeCtrl.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final h = MediaQuery.of(context).size.height;
    final hPad = Responsive.horizontalPadding(context);

    return SizedBox(
      height: h,
      child: Stack(
        children: [
          // Animated background
          const Positioned.fill(child: CyberBackground()),

          // Top-left corner decoration
          Positioned(
            top: 80,
            left: hPad,
            child: _CornerDecoration(),
          ),

          // Bottom-right corner decoration
          Positioned(
            bottom: 40,
            right: hPad,
            child: Transform.rotate(
              angle: 3.14159,
              child: _CornerDecoration(),
            ),
          ),

          // Main content
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: hPad),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pre-title label
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 100),
                    child: Text(
                      '// INITIALIZING PORTFOLIO.EXE',
                      style: AppTheme.labelStyle.copyWith(
                        color: AppTheme.neonMagenta,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Glitch name
                  GlitchText(
                    text: PortfolioData.name,
                    style: AppTheme.displayLarge.copyWith(
                      fontSize: isMobile ? 44 : 80,
                      shadows: [
                        Shadow(
                          color: AppTheme.neonCyan.withOpacity(0.4),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Typing subtitle
                  TypingText(
                    text: '${PortfolioData.title} | ${PortfolioData.subtitle}',
                    style: AppTheme.displaySmall.copyWith(
                      fontSize: isMobile ? 18 : 28,
                      color: AppTheme.neonCyan,
                      fontFamily: 'JetBrainsMono',
                      fontWeight: FontWeight.w400,
                    ),
                    speed: const Duration(milliseconds: 50),
                    onDone: _onTitleDone,
                  ),
                  const SizedBox(height: 24),

                  // Tagline
                  FadeTransition(
                    opacity: _fadeAnim,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? double.infinity : 600,
                      ),
                      child: Text(
                        PortfolioData.tagline,
                        style: AppTheme.bodyLarge.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // CTA buttons
                  FadeTransition(
                    opacity: _fadeAnim,
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        NeonButton(
                          label: 'VIEW PROJECTS',
                          onPressed: widget.onViewProjects,
                          color: AppTheme.neonCyan,
                          icon: Icons.rocket_launch,
                        ),
                        NeonButton(
                          label: 'CONTACT ME',
                          onPressed: widget.onContact,
                          color: AppTheme.neonPurple,
                          outlined: true,
                          icon: Icons.send,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Scroll indicator at bottom
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeAnim,
              child: const _ScrollIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Animated corner bracket decoration
class _CornerDecoration extends StatefulWidget {
  @override
  State<_CornerDecoration> createState() => _CornerDecorationState();
}

class _CornerDecorationState extends State<_CornerDecoration>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) => CustomPaint(
        size: const Size(60, 60),
        painter: _CornerPainter(opacity: 0.3 + _anim.value * 0.4),
      ),
    );
  }
}

class _CornerPainter extends CustomPainter {
  final double opacity;
  _CornerPainter({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.neonCyan.withOpacity(opacity)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    // Top-left corner bracket
    canvas.drawLine(Offset.zero, Offset(24, 0), paint);
    canvas.drawLine(Offset.zero, Offset(0, 24), paint);
  }

  @override
  bool shouldRepaint(_CornerPainter old) => old.opacity != opacity;
}

/// Animated scroll-down indicator
class _ScrollIndicator extends StatefulWidget {
  const _ScrollIndicator();

  @override
  State<_ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<_ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) => Column(
        children: [
          Text(
            'SCROLL TO EXPLORE',
            style: AppTheme.labelStyle.copyWith(
              fontSize: 9,
              color: AppTheme.textDim,
            ),
          ),
          const SizedBox(height: 8),
          Transform.translate(
            offset: Offset(0, _anim.value * 6),
            child: Icon(
              Icons.keyboard_arrow_down,
              color: AppTheme.neonCyan.withOpacity(0.4 + _anim.value * 0.4),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
