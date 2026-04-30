// /// Models for all portfolio data.
// /// Replace the placeholder data in [PortfolioData] with your real info.

// class ProjectModel {
//   final String title;
//   final String description;
//   final List<String> technologies;
//   final String? githubUrl;
//   final String? demoUrl;
//   final String imagePlaceholderLabel;
//   final String accentColorHex;

//   const ProjectModel({
//     required this.title,
//     required this.description,
//     required this.technologies,
//     this.githubUrl,
//     this.demoUrl,
//     required this.imagePlaceholderLabel,
//     this.accentColorHex = '#00D4FF',
//   });
// }

// class ExperienceModel {
//   final String company;
//   final String role;
//   final String duration;
//   final String location;
//   final List<String> achievements;
//   final bool isInternship;

//   const ExperienceModel({
//     required this.company,
//     required this.role,
//     required this.duration,
//     required this.location,
//     required this.achievements,
//     this.isInternship = true,
//   });
// }

// class SkillModel {
//   final String name;
//   final double proficiency; // 0.0 – 1.0
//   final String category;

//   const SkillModel({
//     required this.name,
//     required this.proficiency,
//     required this.category,
//   });
// }

// /// ─── Placeholder Data ────────────────────────────────────────────────────────
// /// Replace everything below with your real portfolio content.
// class PortfolioData {
//   static const String name = 'YOUR NAME';
//   static const String title = 'Mobile App Developer';
//   static const String subtitle = 'Flutter & React Native';
//   static const String tagline =
//       'Building cross-platform experiences that live at the intersection of performance and design.';
//   static const String email = 'your.email@example.com';
//   static const String githubUrl = 'https://github.com/yourusername';
//   static const String linkedinUrl = 'https://linkedin.com/in/yourusername';

//   static const String aboutText =
//       'I\'m a mobile app developer passionate about crafting high-performance, '
//       'visually stunning applications with Flutter and React Native. '
//       'I specialize in Firebase integration, role-based authentication, '
//       'real-time data systems, and deploying apps that users love. '
//       'From hostel management platforms to healthcare super-apps — I build tools that matter.';

//   // ─── Skills ─────────────────────────────────────────────────────────────────
//   static const List<SkillModel> skills = [
//     SkillModel(name: 'Flutter', proficiency: 0.92, category: 'Mobile'),
//     SkillModel(name: 'Dart', proficiency: 0.90, category: 'Language'),
//     SkillModel(name: 'React Native', proficiency: 0.82, category: 'Mobile'),
//     SkillModel(name: 'Firebase', proficiency: 0.88, category: 'Backend'),
//     SkillModel(name: 'Firestore', proficiency: 0.85, category: 'Backend'),
//     SkillModel(name: 'JavaScript', proficiency: 0.78, category: 'Language'),
//     SkillModel(name: 'TypeScript', proficiency: 0.72, category: 'Language'),
//     SkillModel(name: 'Appwrite', proficiency: 0.70, category: 'Backend'),
//     SkillModel(name: 'REST APIs', proficiency: 0.85, category: 'Integration'),
//     SkillModel(name: 'Git', proficiency: 0.88, category: 'Tools'),
//     SkillModel(name: 'VelocityX', proficiency: 0.75, category: 'State Mgmt'),
//     SkillModel(name: 'Provider', proficiency: 0.80, category: 'State Mgmt'),
//   ];

//   // ─── Projects ───────────────────────────────────────────────────────────────
//   static const List<ProjectModel> projects = [
//     ProjectModel(
//       title: 'Hostel Help',
//       description:
//           'A full-stack complaint management system for college hostel students. '
//           'Features role-based access (student/faculty), real-time complaint tracking, '
//           'Firebase push notifications, and one-complaint-per-day duplicate guard.',
//       technologies: [
//         'Flutter',
//         'Firebase Auth',
//         'Firestore',
//         'FCM',
//         'SharedPreferences'
//       ],
//       githubUrl: 'https://github.com/yourusername/hostel-help',
//       imagePlaceholderLabel: 'HOSTEL HELP',
//       accentColorHex: '#00D4FF',
//     ),
//     ProjectModel(
//       title: 'Aviz Healthcare',
//       description:
//           'Comprehensive healthcare super-app with home nursing, ambulance booking, '
//           'lab tests, pharmacy delivery, physiotherapy, and blood donation matchmaking. '
//           'Live on Play Store with 5K+ downloads and 5.0 rating.',
//       technologies: ['Flutter', 'Firebase', 'Firestore', 'FCM', 'REST API'],
//       demoUrl:
//           'https://play.google.com/store/apps/details?id=com.Aviz.healthcare',
//       imagePlaceholderLabel: 'AVIZ HEALTHCARE',
//       accentColorHex: '#BF00FF',
//     ),
//     ProjectModel(
//       title: 'Flutter Catalog App',
//       description:
//           'E-commerce catalog with live REST API data, VelocityX reactive state management, '
//           'shopping cart with add/remove mutations, dark/light theme system, '
//           'Hero animations, and Navigator 2.0 with deep linking.',
//       technologies: ['Flutter', 'VelocityX', 'REST API', 'Navigator 2.0'],
//       githubUrl: 'https://github.com/yourusername/catalog-app',
//       imagePlaceholderLabel: 'CATALOG APP',
//       accentColorHex: '#FF006E',
//     ),
//     ProjectModel(
//       title: 'React Native Movie App',
//       description:
//           'Movie discovery app with TMDB API integration, Appwrite backend for trending '
//           'algorithm, debounced search, custom useFetch hook with TypeScript generics, '
//           'NativeWind styling, and Expo Router file-based navigation.',
//       technologies: [
//         'React Native',
//         'Expo',
//         'TypeScript',
//         'Appwrite',
//         'NativeWind',
//         'TMDB API'
//       ],
//       githubUrl: 'https://github.com/yourusername/movie-app',
//       imagePlaceholderLabel: 'MOVIE APP',
//       accentColorHex: '#00FF88',
//     ),
//   ];

//   // ─── Experience ──────────────────────────────────────────────────────────────
//   static const List<ExperienceModel> experience = [
//     ExperienceModel(
//       company: 'Aviz Home Healthcare Pvt. Ltd.',
//       role: 'Flutter Developer Intern',
//       duration: '2024',
//       location: 'Remote',
//       isInternship: true,
//       achievements: [
//         'Built role-based access control system for patients, providers, and admins',
//         'Implemented end-to-end Firebase Authentication with email verification',
//         'Integrated Cloud Firestore for real-time service booking data management',
//         'Set up Firebase Cloud Messaging for booking status push notifications',
//         'Contributed to a live app with 5K+ downloads and a 5.0 Play Store rating',
//       ],
//     ),
//   ];
// }

/// Models for all portfolio data.
/// Replace the placeholder data in [PortfolioData] with your real info.

class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final String? githubUrl;
  final String? demoUrl;
  final String imagePlaceholderLabel;
  final String accentColorHex;

  /// List of asset image paths for the screenshot carousel.
  /// e.g. ['assets/screenshots/hostel1.png', 'assets/screenshots/hostel2.png']
  /// Leave empty to show the icon placeholder instead.
  final List<String> screenshots;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.demoUrl,
    required this.imagePlaceholderLabel,
    this.accentColorHex = '#00D4FF',
    this.screenshots = const [],
  });
}

class ExperienceModel {
  final String company;
  final String role;
  final String duration;
  final String location;
  final List<String> achievements;
  final bool isInternship;

  const ExperienceModel({
    required this.company,
    required this.role,
    required this.duration,
    required this.location,
    required this.achievements,
    this.isInternship = true,
  });
}

class SkillModel {
  final String name;
  final double proficiency; // 0.0 – 1.0
  final String category;

  const SkillModel({
    required this.name,
    required this.proficiency,
    required this.category,
  });
}

/// ─── Placeholder Data ────────────────────────────────────────────────────────
/// Replace everything below with your real portfolio content.
class PortfolioData {
  static const String name = 'YOUR NAME';
  static const String title = 'Mobile App Developer';
  static const String subtitle = 'Flutter & React Native';
  static const String tagline =
      'Building cross-platform experiences that live at the intersection of performance and design.';
  static const String email = 'your.email@example.com';
  static const String githubUrl = 'https://github.com/yourusername';
  static const String linkedinUrl = 'https://linkedin.com/in/yourusername';

  static const String aboutText =
      'I\'m a mobile app developer passionate about crafting high-performance, '
      'visually stunning applications with Flutter and React Native. '
      'I specialize in Firebase integration, role-based authentication, '
      'real-time data systems, and deploying apps that users love. '
      'From hostel management platforms to healthcare super-apps — I build tools that matter.';

  // ─── Skills ─────────────────────────────────────────────────────────────────
  static const List<SkillModel> skills = [
    SkillModel(name: 'Flutter', proficiency: 0.92, category: 'Mobile'),
    SkillModel(name: 'Dart', proficiency: 0.90, category: 'Language'),
    SkillModel(name: 'React Native', proficiency: 0.82, category: 'Mobile'),
    SkillModel(name: 'Firebase', proficiency: 0.88, category: 'Backend'),
    SkillModel(name: 'Firestore', proficiency: 0.85, category: 'Backend'),
    SkillModel(name: 'JavaScript', proficiency: 0.78, category: 'Language'),
    SkillModel(name: 'TypeScript', proficiency: 0.72, category: 'Language'),
    SkillModel(name: 'Appwrite', proficiency: 0.70, category: 'Backend'),
    SkillModel(name: 'REST APIs', proficiency: 0.85, category: 'Integration'),
    SkillModel(name: 'Git', proficiency: 0.88, category: 'Tools'),
    SkillModel(name: 'VelocityX', proficiency: 0.75, category: 'State Mgmt'),
    SkillModel(name: 'Provider', proficiency: 0.80, category: 'State Mgmt'),
  ];

  // ─── Projects ───────────────────────────────────────────────────────────────
  // To add screenshots:
  // 1. Put your images in assets/screenshots/  (e.g. hostel1.png)
  // 2. Declare them in pubspec.yaml under flutter > assets
  // 3. Add the paths in the screenshots list below
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'Hostel Help',
      description:
          'A full-stack complaint management system for college hostel students. '
          'Features role-based access (student/faculty), real-time complaint tracking, '
          'Firebase push notifications, and one-complaint-per-day duplicate guard.',
      technologies: [
        'Flutter',
        'Firebase Auth',
        'Firestore',
        'FCM',
        'SharedPreferences'
      ],
      githubUrl: 'https://github.com/yourusername/hostel-help',
      imagePlaceholderLabel: 'HOSTEL HELP',
      accentColorHex: '#00D4FF',
      // Add your screenshots here once you have them:
      // screenshots: ['assets/screenshots/hostel1.png', 'assets/screenshots/hostel2.png'],
      screenshots: [],
    ),
    ProjectModel(
      title: 'Aviz Healthcare',
      description:
          'Comprehensive healthcare super-app with home nursing, ambulance booking, '
          'lab tests, pharmacy delivery, physiotherapy, and blood donation matchmaking. '
          'Live on Play Store with 5K+ downloads and 5.0 rating.',
      technologies: ['Flutter', 'Firebase', 'Firestore', 'FCM', 'REST API'],
      demoUrl:
          'https://play.google.com/store/apps/details?id=com.Aviz.healthcare',
      imagePlaceholderLabel: 'AVIZ HEALTHCARE',
      accentColorHex: '#BF00FF',
      // screenshots: ['assets/screenshots/aviz1.png', 'assets/screenshots/aviz2.png'],
      screenshots: [],
    ),
    ProjectModel(
      title: 'Flutter Catalog App',
      description:
          'E-commerce catalog with live REST API data, VelocityX reactive state management, '
          'shopping cart with add/remove mutations, dark/light theme system, '
          'Hero animations, and Navigator 2.0 with deep linking.',
      technologies: ['Flutter', 'VelocityX', 'REST API', 'Navigator 2.0'],
      githubUrl: 'https://github.com/yourusername/catalog-app',
      imagePlaceholderLabel: 'CATALOG APP',
      accentColorHex: '#FF006E',
      screenshots: [],
    ),
    ProjectModel(
      title: 'React Native Movie App',
      description:
          'Movie discovery app with TMDB API integration, Appwrite backend for trending '
          'algorithm, debounced search, custom useFetch hook with TypeScript generics, '
          'NativeWind styling, and Expo Router file-based navigation.',
      technologies: [
        'React Native',
        'Expo',
        'TypeScript',
        'Appwrite',
        'NativeWind',
        'TMDB API'
      ],
      githubUrl: 'https://github.com/yourusername/movie-app',
      imagePlaceholderLabel: 'MOVIE APP',
      accentColorHex: '#00FF88',
      screenshots: [],
    ),
  ];

  // ─── Experience ──────────────────────────────────────────────────────────────
  static const List<ExperienceModel> experience = [
    ExperienceModel(
      company: 'Aviz Home Healthcare Pvt. Ltd.',
      role: 'Flutter Developer Intern',
      duration: '2024',
      location: 'Remote',
      isInternship: true,
      achievements: [
        'Built role-based access control system for patients, providers, and admins',
        'Implemented end-to-end Firebase Authentication with email verification',
        'Integrated Cloud Firestore for real-time service booking data management',
        'Set up Firebase Cloud Messaging for booking status push notifications',
        'Contributed to a live app with 5K+ downloads and a 5.0 Play Store rating',
      ],
    ),
  ];
}
