// import 'package:flutter/material.dart';
// import '../theme/app_theme.dart';
// import '../utils/responsive.dart';

// /// Minimal footer with copyright and a glowing divider.
// class PortfolioFooter extends StatelessWidget {
//   const PortfolioFooter({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final hPad = Responsive.horizontalPadding(context);

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 32),
//       decoration: BoxDecoration(
//         border: Border(
//           top: BorderSide(
//             color: AppTheme.neonCyan.withOpacity(0.1),
//             width: 1,
//           ),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             '© 2024 — Built with Flutter',
//             style: AppTheme.bodyMedium.copyWith(
//               fontSize: 12,
//               color: AppTheme.textDim,
//             ),
//           ),
//           RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: 'DESIGNED & DEVELOPED BY ',
//                   style: AppTheme.labelStyle.copyWith(
//                     fontSize: 9,
//                     color: AppTheme.textDim,
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'YOU',
//                   style: AppTheme.labelStyle.copyWith(
//                     fontSize: 9,
//                     color: AppTheme.neonCyan,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// Responsive footer — stacks vertically on mobile to avoid overflow.
class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    final copyright = Text(
      '© 2024 — Built with Flutter',
      style: AppTheme.bodyMedium.copyWith(
        fontSize: 12,
        color: AppTheme.textDim,
      ),
    );

    final credit = RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'DESIGNED & DEVELOPED BY ',
            style: AppTheme.labelStyle.copyWith(
              fontSize: 9,
              color: AppTheme.textDim,
            ),
          ),
          TextSpan(
            text: 'YOU',
            style: AppTheme.labelStyle.copyWith(
              fontSize: 9,
              color: AppTheme.neonCyan,
            ),
          ),
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 28),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.neonCyan.withOpacity(0.1), width: 1),
        ),
      ),
      child: isMobile
          // Stack vertically on mobile — no overflow risk
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                copyright,
                const SizedBox(height: 8),
                credit,
              ],
            )
          // Side by side on tablet/desktop
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [copyright, credit],
            ),
    );
  }
}
