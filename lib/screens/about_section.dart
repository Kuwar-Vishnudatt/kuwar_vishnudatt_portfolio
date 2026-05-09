import 'package:flutter/material.dart';
import 'package:kuwar_vishnudatt_portfolio/FadeSlideIn/skill_bar.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';

/// About Me section with glassmorphism card, bio, and skill progress bars.
class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hPad = Responsive.horizontalPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideIn(
            child: const SectionTitle(
              label: '// 01 — ABOUT',
              title: 'WHO AM I',
              accentColor: AppTheme.neonCyan,
            ),
          ),
          const SizedBox(height: 60),
          isMobile ? _MobileLayout() : _DesktopLayout(),
        ],
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: Bio + stats
        Expanded(
          flex: 5,
          child: FadeSlideIn(
            delay: const Duration(milliseconds: 100),
            beginOffset: const Offset(-30, 0),
            child: _BioCard(),
          ),
        ),
        const SizedBox(width: 40),
        // Right: Skills
        Expanded(
          flex: 6,
          child: FadeSlideIn(
            delay: const Duration(milliseconds: 200),
            beginOffset: const Offset(30, 0),
            child: _SkillsCard(),
          ),
        ),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BioCard(),
        const SizedBox(height: 24),
        _SkillsCard(),
      ],
    );
  }
}

class _BioCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name + subtitle header (no avatar)
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    PortfolioData.name,
                    style: AppTheme.displaySmall.copyWith(fontSize: 22),
                  ),
                  Text(
                    PortfolioData.subtitle,
                    style: AppTheme.labelStyle.copyWith(
                      color: AppTheme.neonCyan,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Bio text
          Text(PortfolioData.aboutText, style: AppTheme.bodyLarge),
          const SizedBox(height: 28),
          // Stats row
          Row(
            children: [
              _StatBadge(value: '4+', label: 'PROJECTS'),
              const SizedBox(width: 24),
              _StatBadge(value: '5K+', label: 'APP INSTALLS'),
              const SizedBox(width: 24),
              _StatBadge(value: '5.0', label: 'PLAY RATING'),
            ],
          ),
          const SizedBox(height: 24),
          // Tech stack chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              'Flutter',
              'React Native',
              'Firebase',
              'Dart',
              'TypeScript'
            ]
                .map((t) => SkillChip(label: t, color: AppTheme.neonCyan))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String value;
  final String label;

  const _StatBadge({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTheme.displaySmall.copyWith(
            fontSize: 28,
            color: AppTheme.neonCyan,
            shadows: [
              Shadow(
                color: AppTheme.neonCyan.withOpacity(0.5),
                blurRadius: 12,
              )
            ],
          ),
        ),
        Text(label, style: AppTheme.labelStyle.copyWith(fontSize: 9)),
      ],
    );
  }
}

class _SkillsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Group skills by category for display
    final categories = <String, List<SkillModel>>{};
    for (final s in PortfolioData.skills) {
      categories.putIfAbsent(s.category, () => []).add(s);
    }

    return GlassCard(
      borderColor: AppTheme.neonPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '// SKILL MATRIX',
            style: AppTheme.labelStyle.copyWith(color: AppTheme.neonPurple),
          ),
          const SizedBox(height: 24),
          ...PortfolioData.skills.map((skill) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SkillBar(skill: skill),
              )),
        ],
      ),
    );
  }
}
