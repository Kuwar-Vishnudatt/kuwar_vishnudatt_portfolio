import 'package:flutter/material.dart';
import '../FadeSlideIn/footer.dart';
import '../screens/about_section.dart';
import '../screens/contact_section.dart';
import '../screens/experience_section.dart';
import '../screens/hero_section.dart';
import '../screens/projects_section.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';

/// Main home screen — assembles all sections with a shared scroll controller.
/// Nav bar highlights the active section based on scroll position.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollCtrl = ScrollController();
  int _activeSection = 0;

  // GlobalKeys to find each section's position
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  final List<String> _navLabels = [
    'HOME',
    'ABOUT',
    'EXPERIENCE',
    'PROJECTS',
    'CONTACT'
  ];

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollCtrl.removeListener(_onScroll);
    _scrollCtrl.dispose();
    super.dispose();
  }

  /// Returns the absolute scroll offset of a section using its GlobalKey.
  double? _getKeyOffset(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return null;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null) return null;
    // localToGlobal gives position on screen; add current scroll offset
    // and subtract the nav bar height (64) to get the content offset.
    final pos = box.localToGlobal(Offset.zero);
    return _scrollCtrl.offset + pos.dy - 64;
  }

  void _onScroll() {
    final offset = _scrollCtrl.offset;
    int active = 0;
    // Walk sections from last to first; first one whose top is <= current
    // offset (with a small look-ahead buffer) wins.
    for (int i = _sectionKeys.length - 1; i >= 0; i--) {
      final top = _getKeyOffset(_sectionKeys[i]);
      if (top != null && offset >= top - 80) {
        active = i;
        break;
      }
    }
    if (active != _activeSection) {
      setState(() => _activeSection = active);
    }
  }

  void _scrollToSection(int index) {
    final target = _getKeyOffset(_sectionKeys[index]);
    if (target != null) {
      _scrollCtrl.animateTo(
        target.clamp(0.0, _scrollCtrl.position.maxScrollExtent),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgDark,
      body: Stack(
        children: [
          // Scrollable page content
          SingleChildScrollView(
            controller: _scrollCtrl,
            child: Column(
              children: [
                // Nav bar height spacer
                const SizedBox(height: 64),

                // ── Hero ────────────────────────────────────────────────────
                HeroSection(
                  key: _sectionKeys[0],
                  onViewProjects: () => _scrollToSection(3),
                  onContact: () => _scrollToSection(4),
                ),

                // ── About ───────────────────────────────────────────────────
                AboutSection(key: _sectionKeys[1]),

                // ── Experience ──────────────────────────────────────────────
                ExperienceSection(key: _sectionKeys[2]),

                // ── Projects ────────────────────────────────────────────────
                ProjectsSection(key: _sectionKeys[3]),

                // ── Contact ─────────────────────────────────────────────────
                ContactSection(key: _sectionKeys[4]),

                // ── Footer ──────────────────────────────────────────────────
                const PortfolioFooter(),
              ],
            ),
          ),

          // Fixed top nav bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PortfolioNavBar(
              sections: _navLabels,
              currentSection: _activeSection,
              onNavTap: _scrollToSection,
            ),
          ),
        ],
      ),
    );
  }
}
