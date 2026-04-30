import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Renders text with a cyberpunk glitch animation effect.
class GlitchText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final bool animate;

  const GlitchText({
    Key? key,
    required this.text,
    required this.style,
    this.animate = true,
  }) : super(key: key);

  @override
  State<GlitchText> createState() => _GlitchTextState();
}

class _GlitchTextState extends State<GlitchText> {
  final Random _rng = Random();
  Timer? _timer;
  String _displayed = '';
  bool _glitching = false;

  // Characters used during glitch flicker
  static const String _glitchChars = '!@#\$%^&*<>[]{}|01';

  @override
  void initState() {
    super.initState();
    _displayed = widget.text;
    if (widget.animate) _startGlitchLoop();
  }

  void _startGlitchLoop() {
    // Trigger glitch every 4-8 seconds
    Future.delayed(Duration(milliseconds: 4000 + _rng.nextInt(4000)), () {
      if (!mounted) return;
      _runGlitch();
    });
  }

  void _runGlitch() {
    int step = 0;
    const totalSteps = 12;
    _timer = Timer.periodic(const Duration(milliseconds: 50), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      step++;
      if (step >= totalSteps) {
        t.cancel();
        setState(() {
          _displayed = widget.text;
          _glitching = false;
        });
        _startGlitchLoop();
        return;
      }

      // Randomly replace characters with glitch chars for a few frames
      final chars = widget.text.split('');
      for (int i = 0; i < chars.length; i++) {
        if (_rng.nextDouble() < 0.15) {
          chars[i] = _glitchChars[_rng.nextInt(_glitchChars.length)];
        }
      }
      setState(() {
        _displayed = chars.join();
        _glitching = step % 3 == 0;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Glitch color offset layer (cyan)
        if (_glitching)
          Transform.translate(
            offset: const Offset(-2, 0),
            child: Text(
              _displayed,
              style: widget.style.copyWith(
                color: AppTheme.neonCyan.withOpacity(0.5),
                shadows: null,
              ),
            ),
          ),
        // Glitch color offset layer (magenta)
        if (_glitching)
          Transform.translate(
            offset: const Offset(2, 0),
            child: Text(
              _displayed,
              style: widget.style.copyWith(
                color: AppTheme.neonMagenta.withOpacity(0.5),
                shadows: null,
              ),
            ),
          ),
        // Main text
        Text(_displayed, style: widget.style),
      ],
    );
  }
}

/// Typing-effect text widget — types characters one by one.
class TypingText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration speed;
  final VoidCallback? onDone;

  const TypingText({
    Key? key,
    required this.text,
    required this.style,
    this.speed = const Duration(milliseconds: 60),
    this.onDone,
  }) : super(key: key);

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  String _displayed = '';
  int _index = 0;
  Timer? _timer;
  bool _showCursor = true;
  Timer? _cursorTimer;

  @override
  void initState() {
    super.initState();
    _startTyping();
    _startCursorBlink();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.speed, (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      if (_index >= widget.text.length) {
        t.cancel();
        widget.onDone?.call();
        return;
      }
      setState(() {
        _displayed += widget.text[_index];
        _index++;
      });
    });
  }

  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (!mounted) return;
      setState(() => _showCursor = !_showCursor);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: _displayed,
        style: widget.style,
        children: [
          TextSpan(
            text: _showCursor ? '|' : ' ',
            style: widget.style.copyWith(
              color: AppTheme.neonCyan,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
