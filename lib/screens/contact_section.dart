import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/neon_button.dart';
import '../widgets/section_title.dart';

/// Contact section with futuristic input fields and social link buttons.
class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _msgCtrl = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    // No backend — just show success state
    setState(() => _submitted = true);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _submitted = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hPad = Responsive.horizontalPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 100),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.bgDark, Color(0xFF080D1F)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FadeSlideIn(
            child: SectionTitle(
              label: '// 04 — CONTACT',
              title: 'GET IN TOUCH',
              accentColor: AppTheme.neonMagenta,
            ),
          ),
          const SizedBox(height: 60),
          isMobile
              ? _MobileLayout(
                  submitted: _submitted,
                  nameCtrl: _nameCtrl,
                  emailCtrl: _emailCtrl,
                  msgCtrl: _msgCtrl,
                  onSubmit: _handleSubmit,
                )
              : _DesktopLayout(
                  submitted: _submitted,
                  nameCtrl: _nameCtrl,
                  emailCtrl: _emailCtrl,
                  msgCtrl: _msgCtrl,
                  onSubmit: _handleSubmit,
                ),
        ],
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  final bool submitted;
  final TextEditingController nameCtrl, emailCtrl, msgCtrl;
  final VoidCallback onSubmit;

  const _DesktopLayout({
    required this.submitted,
    required this.nameCtrl,
    required this.emailCtrl,
    required this.msgCtrl,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: FadeSlideIn(
            beginOffset: const Offset(-30, 0),
            child: _ContactForm(
              submitted: submitted,
              nameCtrl: nameCtrl,
              emailCtrl: emailCtrl,
              msgCtrl: msgCtrl,
              onSubmit: onSubmit,
            ),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 4,
          child: FadeSlideIn(
            delay: const Duration(milliseconds: 150),
            beginOffset: const Offset(30, 0),
            child: _SocialPanel(),
          ),
        ),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final bool submitted;
  final TextEditingController nameCtrl, emailCtrl, msgCtrl;
  final VoidCallback onSubmit;

  const _MobileLayout({
    required this.submitted,
    required this.nameCtrl,
    required this.emailCtrl,
    required this.msgCtrl,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ContactForm(
          submitted: submitted,
          nameCtrl: nameCtrl,
          emailCtrl: emailCtrl,
          msgCtrl: msgCtrl,
          onSubmit: onSubmit,
        ),
        const SizedBox(height: 32),
        _SocialPanel(),
      ],
    );
  }
}

/// The glowing input form
class _ContactForm extends StatelessWidget {
  final bool submitted;
  final TextEditingController nameCtrl, emailCtrl, msgCtrl;
  final VoidCallback onSubmit;

  const _ContactForm({
    required this.submitted,
    required this.nameCtrl,
    required this.emailCtrl,
    required this.msgCtrl,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    if (submitted) {
      return _SuccessMessage();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NeonInput(
          controller: nameCtrl,
          label: 'YOUR NAME',
          hint: 'John Doe',
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 20),
        _NeonInput(
          controller: emailCtrl,
          label: 'EMAIL ADDRESS',
          hint: 'john@example.com',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        _NeonInput(
          controller: msgCtrl,
          label: 'MESSAGE',
          hint: 'Tell me about your project...',
          icon: Icons.message_outlined,
          maxLines: 5,
        ),
        const SizedBox(height: 28),
        NeonButton(
          label: 'TRANSMIT MESSAGE',
          onPressed: onSubmit,
          color: AppTheme.neonMagenta,
          icon: Icons.send,
        ),
      ],
    );
  }
}

class _SuccessMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.neonGreen.withOpacity(0.08),
            AppTheme.bgCard,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.neonGreen.withOpacity(0.3),
        ),
        boxShadow: AppTheme.cyanGlow(intensity: 0.3),
      ),
      child: Column(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: AppTheme.neonGreen,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            'MESSAGE TRANSMITTED',
            style: AppTheme.displaySmall.copyWith(
              fontSize: 22,
              color: AppTheme.neonGreen,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Thanks for reaching out. I\'ll get back to you soon.',
            style: AppTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Social links and info panel
class _SocialPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '// CONNECT WITH ME',
          style: AppTheme.labelStyle.copyWith(color: AppTheme.neonMagenta),
        ),
        const SizedBox(height: 24),
        Text(
          'Always open to discussing new projects, creative ideas, or opportunities to be part of your vision.',
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: 32),
        _SocialLink(
          icon: Icons.email_outlined,
          label: 'Email',
          value: PortfolioData.email,
          color: AppTheme.neonCyan,
        ),
        const SizedBox(height: 16),
        _SocialLink(
          icon: Icons.code,
          label: 'GitHub',
          value: 'github.com/Kuwar-Vishnudatt',
          color: AppTheme.neonPurple,
        ),
        const SizedBox(height: 16),
        _SocialLink(
          icon: Icons.business_center_outlined,
          label: 'LinkedIn',
          value: 'linkedin.com/in/kuwar-vishnudatt-/',
          color: AppTheme.neonGreen,
        ),
        const SizedBox(height: 40),
        // Location badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.neonCyan.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(8),
            color: AppTheme.neonCyan.withOpacity(0.04),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_outlined,
                  color: AppTheme.neonCyan.withOpacity(0.5), size: 16),
              const SizedBox(width: 8),
              Text(
                'Available for remote opportunities',
                style: AppTheme.bodyMedium.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialLink extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _SocialLink({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  State<_SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<_SocialLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.color.withOpacity(_hovered ? 0.08 : 0),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.color.withOpacity(_hovered ? 0.4 : 0.15),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.15),
                    blurRadius: 16,
                  )
                ]
              : [],
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color.withOpacity(0.1),
                border: Border.all(
                  color: widget.color.withOpacity(0.3),
                  width: 0.8,
                ),
              ),
              child: Icon(widget.icon, color: widget.color, size: 18),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label.toUpperCase(),
                  style: AppTheme.labelStyle.copyWith(
                    color: widget.color.withOpacity(0.7),
                    fontSize: 10,
                  ),
                ),
                Text(
                  widget.value,
                  style: AppTheme.bodyMedium.copyWith(
                    color: _hovered
                        ? AppTheme.textPrimary
                        : AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Glowing neon input field
class _NeonInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final int maxLines;
  final TextInputType? keyboardType;

  const _NeonInput({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  State<_NeonInput> createState() => _NeonInputState();
}

class _NeonInputState extends State<_NeonInput> {
  bool _focused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() {
        setState(() => _focused = _focusNode.hasFocus);
      });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = _focused ? AppTheme.neonMagenta : AppTheme.neonCyan;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTheme.labelStyle.copyWith(fontSize: 10)),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: color.withOpacity(_focused ? 0.6 : 0.2),
              width: _focused ? 1.5 : 1,
            ),
            color: color.withOpacity(_focused ? 0.06 : 0.02),
            boxShadow: _focused
                ? [
                    BoxShadow(
                      color: color.withOpacity(0.15),
                      blurRadius: 12,
                      spreadRadius: 1,
                    )
                  ]
                : [],
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            maxLines: widget.maxLines,
            keyboardType: widget.keyboardType,
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.textPrimary,
            ),
            cursorColor: AppTheme.neonMagenta,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: AppTheme.bodyMedium.copyWith(color: AppTheme.textDim),
              prefixIcon: Icon(
                widget.icon,
                color: color.withOpacity(_focused ? 0.8 : 0.3),
                size: 18,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
