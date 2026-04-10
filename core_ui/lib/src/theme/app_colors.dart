part of 'app_theme.dart';

class AppColors {
  static const Color transparent = Color.fromRGBO(0, 0, 0, 0);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color selago = Color.fromRGBO(248, 249, 254, 1);
  static const Color mercury = Color.fromRGBO(225, 229, 229, 1);
  static const Color fiddleheadGreen = Color.fromRGBO(42, 99, 84, 1);

  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color mirage = Color.fromRGBO(27, 28, 49, 1);
  static const Color mako = Color.fromRGBO(66, 71, 81, 1);
  static const Color gray = Color.fromRGBO(128, 128, 128, 1);
  static const Color silverChalice = Color.fromRGBO(170, 170, 170, 1);

  static const Color titanWhite = Color.fromRGBO(229, 232, 255, 1);
  static const Color hawkesBlue = Color.fromRGBO(178, 224, 255, 0.8);
  static const Color blueMarguerite = Color.fromRGBO(100, 109, 194, 1.0);
  static const Color royalBlue = Color.fromRGBO(72, 86, 223, 1);

  static const Color blueChalk = Color.fromRGBO(236, 216, 255, 1);
  static const Color coldPurple = Color.fromRGBO(179, 157, 219, 1);
  static const Color purpleHeart = Color.fromRGBO(103, 58, 183, 1);

  static const Color hotRed = Color.fromRGBO(183, 18, 31, 1);

  static const Color powderBlue = Color.fromRGBO(188, 234, 233, 1.0);

  static const bg = Color(0xFF0B0E14);
  static const surface = Color(0xFF141820);
  static const surfaceElevated = Color(0xFF1C2230);
  static const border = Color(0xFF252D3D);
  static const borderLight = Color(0xFF2E3A50);

  static const primary = Color(0xFF3DD68C);
  static const primaryDim = Color(0xFF1E7A50);
  static const primaryGlow = Color(0x333DD68C);
  static const accent = Color(0xFFF5A623);
  static const accentBlue = Color(0xFF4A9EF5);
  static const accentPurple = Color(0xFF9B7FEA);
  static const accentRed = Color(0xFFE8485A);

  static const textPrimary = Color(0xFFE8EDF5);
  static const textSecondary = Color(0xFF7A8BA5);
  static const textMuted = Color(0xFF4A5568);

  static const chartColors = [
    Color(0xFF3DD68C),
    Color(0xFF4A9EF5),
    Color(0xFFF5A623),
    Color(0xFF9B7FEA),
    Color(0xFFE8485A),
    Color(0xFF26C6DA),
    Color(0xFFFFB347),
    Color(0xFFFF69B4),
    Color(0xFF7EC8E3),
    Color(0xFFA8E063),
  ];

  // Status colors
  static const statusResolved = Color(0xFF3DD68C);
  static const statusReceived = Color(0xFF4A9EF5);
  static const statusInvestigating = Color(0xFFF5A623);
  static const statusFalse = Color(0xFFE8485A);

  static Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'išspręsta':
        return statusResolved;
      case 'gautas':
        return statusReceived;
      case 'tiriamas':
        return statusInvestigating;
      case 'nepasitvirtino':
        return statusFalse;
      default:
        return textMuted;
    }
  }

  static Color categoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'trash':
        return chartColors[0];
      case 'forest':
        return chartColors[1];
      case 'beetle':
        return chartColors[2];
      case 'permits':
        return chartColors[3];
      case 'misc':
        return chartColors[4];
      default:
        return textMuted;
    }
  }
}

class Deco {
  static BoxDecoration card(
      {Color? color, double radius = 16, bool glow = false}) {
    return BoxDecoration(
      color: color ?? AppColors.surface,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: AppColors.border, width: 1),
      boxShadow: glow
          ? [
              const BoxShadow(
                  color: AppColors.primaryGlow, blurRadius: 24, spreadRadius: 0)
            ]
          : [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4))
            ],
    );
  }

  static BoxDecoration glassCard({double radius = 16}) {
    return BoxDecoration(
      color: AppColors.surfaceElevated.withValues(alpha: 0.7),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: AppColors.borderLight, width: 1),
    );
  }
}
