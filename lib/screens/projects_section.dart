import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

/// Projects section with responsive grid of cyberpunk project cards.
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final hPad = Responsive.horizontalPadding(context);

    final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 2);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 100),
      decoration: BoxDecoration(
        // Subtle different background for contrast
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.bgDark,
            const Color(0xFF080D1F),
            AppTheme.bgDark,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideIn(
            child: const SectionTitle(
              label: '// 02 — PROJECTS',
              title: 'WHAT I\'VE BUILT',
              accentColor: AppTheme.neonMagenta,
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            delay: const Duration(milliseconds: 100),
            child: Text(
              'A selection of cross-platform mobile applications — from healthcare to entertainment.',
              style: AppTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 60),

          // Project grid
          isMobile
              ? _MobileGrid()
              : _DesktopGrid(crossAxisCount: crossAxisCount),
        ],
      ),
    );
  }
}

class _DesktopGrid extends StatelessWidget {
  final int crossAxisCount;

  const _DesktopGrid({required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioData.projects;
    // Build rows of crossAxisCount cards
    final rows = <Widget>[];
    for (int i = 0; i < projects.length; i += crossAxisCount) {
      final rowProjects = projects.sublist(
        i,
        (i + crossAxisCount).clamp(0, projects.length),
      );
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rowProjects.asMap().entries.map((entry) {
              final delay = Duration(milliseconds: 100 * entry.key);
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: entry.key < rowProjects.length - 1 ? 24 : 0,
                  ),
                  child: FadeSlideIn(
                    delay: delay,
                    child: ProjectCard(project: entry.value),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
      if (i + crossAxisCount < projects.length) {
        rows.add(const SizedBox(height: 24));
      }
    }
    return Column(children: rows);
  }
}

class _MobileGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: PortfolioData.projects.asMap().entries.map((entry) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: entry.key < PortfolioData.projects.length - 1 ? 20 : 0,
          ),
          child: FadeSlideIn(
            delay: Duration(milliseconds: 80 * entry.key),
            child: ProjectCard(project: entry.value),
          ),
        );
      }).toList(),
    );
  }
}
