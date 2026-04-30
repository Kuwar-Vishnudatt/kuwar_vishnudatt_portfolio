// import 'package:flutter/material.dart';
// import '../models/portfolio_data.dart';
// import '../theme/app_theme.dart';
// import '../utils/responsive.dart';
// import 'section_title.dart';

// /// Cyberpunk project card with hover glow, neon border, and tech chips.
// class ProjectCard extends StatefulWidget {
//   final ProjectModel project;

//   const ProjectCard({Key? key, required this.project}) : super(key: key);

//   @override
//   State<ProjectCard> createState() => _ProjectCardState();
// }

// class _ProjectCardState extends State<ProjectCard>
//     with SingleTickerProviderStateMixin {
//   bool _hovered = false;
//   late AnimationController _glowCtrl;
//   late Animation<double> _glowAnim;

//   @override
//   void initState() {
//     super.initState();
//     _glowCtrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     )..repeat(reverse: true);
//     _glowAnim = Tween<double>(begin: 0.4, end: 1.0).animate(_glowCtrl);
//   }

//   @override
//   void dispose() {
//     _glowCtrl.dispose();
//     super.dispose();
//   }

//   Color get _accent {
//     final hex = widget.project.accentColorHex.replaceAll('#', '');
//     return Color(int.parse('FF$hex', radix: 16));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _hovered = true),
//       onExit: (_) => setState(() => _hovered = false),
//       child: AnimatedBuilder(
//         animation: _glowAnim,
//         builder: (_, __) {
//           return AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             transform: Matrix4.identity()..scale(_hovered ? 1.02 : 1.0),
//             transformAlignment: Alignment.center,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   _accent.withOpacity(_hovered ? 0.12 : 0.06),
//                   AppTheme.bgCard.withOpacity(0.9),
//                 ],
//               ),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: _accent.withOpacity(
//                   _hovered ? 0.7 : 0.2 * _glowAnim.value,
//                 ),
//                 width: _hovered ? 1.5 : 1,
//               ),
//               boxShadow: _hovered
//                   ? [
//                       BoxShadow(
//                         color: _accent.withOpacity(0.25),
//                         blurRadius: 30,
//                         spreadRadius: 2,
//                       ),
//                       BoxShadow(
//                         color: _accent.withOpacity(0.1),
//                         blurRadius: 60,
//                         spreadRadius: 8,
//                       ),
//                     ]
//                   : [
//                       BoxShadow(
//                         color: _accent.withOpacity(0.05),
//                         blurRadius: 20,
//                       ),
//                     ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Image placeholder
//                 _ImagePlaceholder(
//                   label: widget.project.imagePlaceholderLabel,
//                   color: _accent,
//                   hovered: _hovered,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Title
//                       Text(
//                         widget.project.title,
//                         style: AppTheme.displaySmall.copyWith(
//                           fontSize: 20,
//                           color: _hovered ? _accent : AppTheme.textPrimary,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       // Description
//                       Text(
//                         widget.project.description,
//                         style: AppTheme.bodyMedium,
//                         maxLines: 4,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const SizedBox(height: 16),
//                       // Tech chips
//                       Wrap(
//                         spacing: 6,
//                         runSpacing: 6,
//                         children: widget.project.technologies
//                             .map((t) => _TechChip(label: t, color: _accent))
//                             .toList(),
//                       ),
//                       const SizedBox(height: 16),
//                       // Links
//                       Row(
//                         children: [
//                           if (widget.project.githubUrl != null)
//                             _LinkButton(
//                               label: 'GITHUB',
//                               icon: Icons.code,
//                               color: _accent,
//                               onTap: () {},
//                             ),
//                           if (widget.project.githubUrl != null &&
//                               widget.project.demoUrl != null)
//                             const SizedBox(width: 12),
//                           if (widget.project.demoUrl != null)
//                             _LinkButton(
//                               label: 'LIVE DEMO',
//                               icon: Icons.open_in_new,
//                               color: _accent,
//                               onTap: () {},
//                             ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class _ImagePlaceholder extends StatelessWidget {
//   final String label;
//   final Color color;
//   final bool hovered;

//   const _ImagePlaceholder({
//     required this.label,
//     required this.color,
//     required this.hovered,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       height: 160,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             color.withOpacity(hovered ? 0.15 : 0.08),
//             AppTheme.bgDark.withOpacity(0.5),
//           ],
//         ),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(12),
//           topRight: Radius.circular(12),
//         ),
//         border: Border(
//           bottom: BorderSide(color: color.withOpacity(0.2), width: 1),
//         ),
//       ),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.phone_android, color: color.withOpacity(0.4), size: 36),
//             const SizedBox(height: 8),
//             Text(
//               label,
//               style: AppTheme.labelStyle.copyWith(
//                 color: color.withOpacity(0.5),
//                 fontSize: 10,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TechChip extends StatelessWidget {
//   final String label;
//   final Color color;

//   const _TechChip({required this.label, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.08),
//         borderRadius: BorderRadius.circular(3),
//         border: Border.all(color: color.withOpacity(0.3), width: 0.8),
//       ),
//       child: Text(
//         label,
//         style: AppTheme.chipStyle.copyWith(color: color.withOpacity(0.9)),
//       ),
//     );
//   }
// }

// class _LinkButton extends StatefulWidget {
//   final String label;
//   final IconData icon;
//   final Color color;
//   final VoidCallback onTap;

//   const _LinkButton({
//     required this.label,
//     required this.icon,
//     required this.color,
//     required this.onTap,
//   });

//   @override
//   State<_LinkButton> createState() => _LinkButtonState();
// }

// class _LinkButtonState extends State<_LinkButton> {
//   bool _hovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _hovered = true),
//       onExit: (_) => setState(() => _hovered = false),
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: widget.onTap,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: widget.color.withOpacity(_hovered ? 0.8 : 0.3),
//             ),
//             borderRadius: BorderRadius.circular(3),
//             color:
//                 _hovered ? widget.color.withOpacity(0.1) : Colors.transparent,
//             boxShadow: _hovered
//                 ? [
//                     BoxShadow(
//                       color: widget.color.withOpacity(0.2),
//                       blurRadius: 10,
//                     )
//                   ]
//                 : [],
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(widget.icon, size: 12, color: widget.color.withOpacity(0.9)),
//               const SizedBox(width: 6),
//               Text(
//                 widget.label,
//                 style: AppTheme.chipStyle.copyWith(
//                   color: widget.color.withOpacity(0.9),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

/// Cyberpunk project card with:
/// - Screenshot carousel (auto-advances, dots indicator, swipe support)
/// - Falls back to icon placeholder when screenshots list is empty
/// - Hover glow, neon border, tech chips, and link buttons
class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late AnimationController _glowCtrl;
  late Animation<double> _glowAnim;

  Color get _accent {
    final hex = widget.project.accentColorHex.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  @override
  void initState() {
    super.initState();
    _glowCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
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
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedBuilder(
        animation: _glowAnim,
        builder: (_, __) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.identity()..scale(_hovered ? 1.02 : 1.0),
            transformAlignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _accent.withOpacity(_hovered ? 0.12 : 0.06),
                  AppTheme.bgCard.withOpacity(0.9),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    _accent.withOpacity(_hovered ? 0.7 : 0.2 * _glowAnim.value),
                width: _hovered ? 1.5 : 1,
              ),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                          color: _accent.withOpacity(0.25),
                          blurRadius: 30,
                          spreadRadius: 2),
                      BoxShadow(
                          color: _accent.withOpacity(0.1),
                          blurRadius: 60,
                          spreadRadius: 8),
                    ]
                  : [
                      BoxShadow(
                          color: _accent.withOpacity(0.05), blurRadius: 20),
                    ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Top image area: carousel or placeholder ──────────────────
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: widget.project.screenshots.isEmpty
                      ? _IconPlaceholder(
                          label: widget.project.imagePlaceholderLabel,
                          color: _accent,
                          hovered: _hovered,
                        )
                      : _ScreenshotCarousel(
                          screenshots: widget.project.screenshots,
                          accent: _accent,
                        ),
                ),

                // ── Card body ────────────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: AppTheme.displaySmall.copyWith(
                          fontSize: 20,
                          color: _hovered ? _accent : AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.project.description,
                        style: AppTheme.bodyMedium,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: widget.project.technologies
                            .map((t) => _TechChip(label: t, color: _accent))
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      // Links row
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          if (widget.project.githubUrl != null)
                            _LinkButton(
                              label: 'GITHUB',
                              icon: Icons.code,
                              color: _accent,
                              onTap: () {},
                            ),
                          if (widget.project.demoUrl != null)
                            _LinkButton(
                              label: 'LIVE DEMO',
                              icon: Icons.open_in_new,
                              color: _accent,
                              onTap: () {},
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ─── Screenshot Carousel ──────────────────────────────────────────────────────

class _ScreenshotCarousel extends StatefulWidget {
  final List<String> screenshots;
  final Color accent;

  const _ScreenshotCarousel({
    required this.screenshots,
    required this.accent,
  });

  @override
  State<_ScreenshotCarousel> createState() => _ScreenshotCarouselState();
}

class _ScreenshotCarouselState extends State<_ScreenshotCarousel> {
  final PageController _pageCtrl = PageController();
  int _current = 0;

  @override
  void initState() {
    super.initState();
    // Auto-advance every 3 seconds if there are multiple screenshots
    if (widget.screenshots.length > 1) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      final next = (_current + 1) % widget.screenshots.length;
      _pageCtrl.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _startAutoPlay();
    });
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          // ── PageView of screenshots ───────────────────────────────────────
          PageView.builder(
            controller: _pageCtrl,
            onPageChanged: (i) => setState(() => _current = i),
            itemCount: widget.screenshots.length,
            itemBuilder: (_, i) => Image.asset(
              widget.screenshots[i],
              fit: BoxFit.cover,
              width: double.infinity,
              // Graceful fallback if asset is missing
              errorBuilder: (_, __, ___) => _IconPlaceholder(
                label: 'SCREENSHOT ${i + 1}',
                color: widget.accent,
                hovered: false,
              ),
            ),
          ),

          // ── Gradient overlay at bottom for readability ────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppTheme.bgCard.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),

          // ── Dot indicators ───────────────────────────────────────────────
          if (widget.screenshots.length > 1)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.screenshots.length, (i) {
                  final isActive = i == _current;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: isActive ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: isActive
                          ? widget.accent
                          : widget.accent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: widget.accent.withOpacity(0.6),
                                blurRadius: 6,
                              )
                            ]
                          : [],
                    ),
                  );
                }),
              ),
            ),

          // ── Left / Right arrow buttons ────────────────────────────────────
          if (widget.screenshots.length > 1) ...[
            Positioned(
              left: 8,
              top: 0,
              bottom: 0,
              child: Center(
                child: _CarouselArrow(
                  icon: Icons.chevron_left,
                  color: widget.accent,
                  onTap: () {
                    final prev = (_current - 1 + widget.screenshots.length) %
                        widget.screenshots.length;
                    _pageCtrl.animateToPage(prev,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut);
                  },
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 0,
              bottom: 0,
              child: Center(
                child: _CarouselArrow(
                  icon: Icons.chevron_right,
                  color: widget.accent,
                  onTap: () {
                    final next = (_current + 1) % widget.screenshots.length;
                    _pageCtrl.animateToPage(next,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut);
                  },
                ),
              ),
            ),
          ],

          // ── Screenshot count badge (top-right) ───────────────────────────
          if (widget.screenshots.length > 1)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.bgDark.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: widget.accent.withOpacity(0.4), width: 0.8),
                ),
                child: Text(
                  '${_current + 1} / ${widget.screenshots.length}',
                  style: AppTheme.labelStyle.copyWith(
                    color: widget.accent,
                    fontSize: 9,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CarouselArrow extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _CarouselArrow({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<_CarouselArrow> createState() => _CarouselArrowState();
}

class _CarouselArrowState extends State<_CarouselArrow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hovered
                ? widget.color.withOpacity(0.25)
                : AppTheme.bgDark.withOpacity(0.5),
            border: Border.all(
              color: widget.color.withOpacity(_hovered ? 0.7 : 0.3),
              width: 1,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: widget.color.withOpacity(0.3),
                      blurRadius: 8,
                    )
                  ]
                : [],
          ),
          child: Icon(widget.icon, color: widget.color, size: 18),
        ),
      ),
    );
  }
}

// ─── Icon Placeholder (fallback when no screenshots) ─────────────────────────

class _IconPlaceholder extends StatelessWidget {
  final String label;
  final Color color;
  final bool hovered;

  const _IconPlaceholder({
    required this.label,
    required this.color,
    required this.hovered,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(hovered ? 0.15 : 0.08),
            AppTheme.bgDark.withOpacity(0.5),
          ],
        ),
        border: Border(
          bottom: BorderSide(color: color.withOpacity(0.2), width: 1),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_android, color: color.withOpacity(0.35), size: 40),
            const SizedBox(height: 10),
            Text(
              label,
              style: AppTheme.labelStyle.copyWith(
                color: color.withOpacity(0.45),
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'ADD SCREENSHOTS IN portfolio_data.dart',
              style: AppTheme.labelStyle.copyWith(
                color: color.withOpacity(0.25),
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Tech Chip ────────────────────────────────────────────────────────────────

class _TechChip extends StatelessWidget {
  final String label;
  final Color color;

  const _TechChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: color.withOpacity(0.3), width: 0.8),
      ),
      child: Text(
        label,
        style: AppTheme.chipStyle.copyWith(color: color.withOpacity(0.9)),
      ),
    );
  }
}

// ─── Link Button ──────────────────────────────────────────────────────────────

class _LinkButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _LinkButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.color.withOpacity(_hovered ? 0.8 : 0.3),
            ),
            borderRadius: BorderRadius.circular(3),
            color:
                _hovered ? widget.color.withOpacity(0.1) : Colors.transparent,
            boxShadow: _hovered
                ? [
                    BoxShadow(
                        color: widget.color.withOpacity(0.2), blurRadius: 10)
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 12, color: widget.color.withOpacity(0.9)),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: AppTheme.chipStyle
                    .copyWith(color: widget.color.withOpacity(0.9)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
