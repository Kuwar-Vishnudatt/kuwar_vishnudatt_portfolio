import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';

/// Experience section with a glowing vertical timeline design.
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.horizontalPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideIn(
            child: const SectionTitle(
              label: '// 03 — EXPERIENCE',
              title: 'WHERE I\'VE WORKED',
              accentColor: AppTheme.neonGreen,
            ),
          ),
          const SizedBox(height: 60),

          // Timeline
          ...PortfolioData.experience.asMap().entries.map((entry) {
            final i = entry.key;
            final exp = entry.value;
            return FadeSlideIn(
              delay: Duration(milliseconds: 100 * i),
              beginOffset: const Offset(-40, 0),
              child: _TimelineEntry(
                experience: exp,
                isLast: i == PortfolioData.experience.length - 1,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TimelineEntry extends StatefulWidget {
  final ExperienceModel experience;
  final bool isLast;

  const _TimelineEntry({required this.experience, required this.isLast});

  @override
  State<_TimelineEntry> createState() => _TimelineEntryState();
}

class _TimelineEntryState extends State<_TimelineEntry>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowCtrl;
  late Animation<double> _glowAnim;

  @override
  void initState() {
    super.initState();
    _glowCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
    _glowAnim = Tween<double>(begin: 0.4, end: 1.0).animate(_glowCtrl);
  }

  @override
  void dispose() {
    _glowCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline column: dot + line
          SizedBox(
            width: 40,
            child: Column(
              children: [
                const SizedBox(height: 6),
                // Glowing dot
                AnimatedBuilder(
                  animation: _glowAnim,
                  builder: (_, __) => Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.neonGreen,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.neonGreen
                              .withOpacity(0.6 * _glowAnim.value),
                          blurRadius: 12 * _glowAnim.value,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.bgDark,
                        ),
                      ),
                    ),
                  ),
                ),
                // Glowing vertical line
                if (!widget.isLast)
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _glowAnim,
                      builder: (_, __) => Container(
                        width: 1.5,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppTheme.neonGreen
                                  .withOpacity(0.6 * _glowAnim.value),
                              AppTheme.neonGreen.withOpacity(0.1),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.neonGreen
                                  .withOpacity(0.2 * _glowAnim.value),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 24),

          // Content card
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 40),
              child: _ExperienceCard(experience: widget.experience),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceModel experience;

  const _ExperienceCard({required this.experience});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.neonGreen.withOpacity(_hovered ? 0.08 : 0.04),
              AppTheme.bgCard.withOpacity(0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.neonGreen.withOpacity(_hovered ? 0.5 : 0.15),
            width: 1,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppTheme.neonGreen.withOpacity(0.12),
                    blurRadius: 24,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Wrap(
              spacing: 12,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  widget.experience.role,
                  style: AppTheme.displaySmall.copyWith(
                    fontSize: 20,
                    color: _hovered ? AppTheme.neonGreen : AppTheme.textPrimary,
                  ),
                ),
                _Badge(
                  label: widget.experience.isInternship
                      ? 'INTERNSHIP'
                      : 'FULL-TIME',
                  color: AppTheme.neonGreen,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Company + duration
            Row(
              children: [
                Icon(Icons.business,
                    size: 13, color: AppTheme.neonGreen.withOpacity(0.6)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    widget.experience.company,
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Icon(Icons.calendar_today, size: 12, color: AppTheme.textDim),
                const SizedBox(width: 4),
                Text(
                  widget.experience.duration,
                  style: AppTheme.labelStyle.copyWith(
                    color: AppTheme.textDim,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Achievements
            Text(
              '// ACHIEVEMENTS',
              style: AppTheme.labelStyle
                  .copyWith(color: AppTheme.neonGreen, fontSize: 10),
            ),
            const SizedBox(height: 12),
            ...widget.experience.achievements.map((a) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '▸ ',
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.neonGreen,
                        ),
                      ),
                      Expanded(
                        child: Text(a, style: AppTheme.bodyMedium),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: color.withOpacity(0.4), width: 0.8),
      ),
      child: Text(
        label,
        style: AppTheme.chipStyle.copyWith(color: color, fontSize: 10),
      ),
    );
  }
}
