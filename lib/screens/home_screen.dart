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
    'PROJECTS',
    'EXPERIENCE',
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

  void _onScroll() {
    final screenH = MediaQuery.of(context).size.height;
    final offset = _scrollCtrl.offset;

    // Approximate section heights for nav highlighting
    // (sections are estimated — fine-tune per actual heights)
    int active = 0;
    if (offset < screenH * 0.8) {
      active = 0;
    } else if (offset < screenH * 1.8) {
      active = 1;
    } else if (offset < screenH * 2.8) {
      active = 2;
    } else if (offset < screenH * 3.6) {
      active = 3;
    } else {
      active = 4;
    }

    if (active != _activeSection) {
      setState(() => _activeSection = active);
    }
  }

  void _scrollToSection(int index) {
    // Approximate pixel offsets per section
    final screenH = MediaQuery.of(context).size.height;
    final offsets = [
      0.0,
      screenH * 0.95,
      screenH * 1.9,
      screenH * 2.9,
      screenH * 3.7,
    ];

    _scrollCtrl.animateTo(
      offsets[index],
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
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
                  onViewProjects: () => _scrollToSection(2),
                  onContact: () => _scrollToSection(4),
                ),

                // ── About ───────────────────────────────────────────────────
                AboutSection(key: _sectionKeys[1]),

                // ── Projects ────────────────────────────────────────────────
                ProjectsSection(key: _sectionKeys[2]),

                // ── Experience ──────────────────────────────────────────────
                ExperienceSection(key: _sectionKeys[3]),

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
