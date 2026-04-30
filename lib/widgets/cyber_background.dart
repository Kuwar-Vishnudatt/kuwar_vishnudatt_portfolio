import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Animated background with floating particles and a subtle grid overlay.
class CyberBackground extends StatefulWidget {
  const CyberBackground({Key? key}) : super(key: key);

  @override
  State<CyberBackground> createState() => _CyberBackgroundState();
}

class _CyberBackgroundState extends State<CyberBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  final Random _rng = Random();

  @override
  void initState() {
    super.initState();
    // Generate 60 particles with random positions and speeds
    for (int i = 0; i < 60; i++) {
      _particles.add(_Particle(
        x: _rng.nextDouble(),
        y: _rng.nextDouble(),
        radius: _rng.nextDouble() * 2 + 0.5,
        speed: _rng.nextDouble() * 0.0003 + 0.0001,
        opacity: _rng.nextDouble() * 0.6 + 0.1,
        color: _rng.nextBool() ? AppTheme.neonCyan : AppTheme.neonPurple,
      ));
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
    )..repeat();

    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BackgroundPainter(
        particles: _particles,
        progress: _controller.value,
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _Particle {
  double x, y, radius, speed, opacity;
  Color color;
  _Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.opacity,
    required this.color,
  });
}

class _BackgroundPainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;

  _BackgroundPainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw radial gradient background
    final bgPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.3, -0.5),
        radius: 1.2,
        colors: [
          const Color(0xFF0A0F2E),
          AppTheme.bgDark,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Draw grid lines
    _drawGrid(canvas, size);

    // Draw particles
    for (final p in particles) {
      final dy = (p.y + progress * p.speed * 10) % 1.0;
      final paint = Paint()
        ..color = p.color.withOpacity(p.opacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
      canvas.drawCircle(
        Offset(p.x * size.width, dy * size.height),
        p.radius,
        paint,
      );
    }
  }

  void _drawGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.neonCyan.withOpacity(0.04)
      ..strokeWidth = 0.5;

    const spacing = 60.0;
    // Vertical lines
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    // Horizontal lines
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_BackgroundPainter old) => old.progress != progress;
}
