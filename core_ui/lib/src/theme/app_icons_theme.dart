part of 'app_theme.dart';

class AppIconsTheme {
  static const String _svgPath = 'assets/svg/';
  static const String _iconPath = 'assets/icons/';

  //Icon paths
  static const String _confirmPathKey = '${_iconPath}confirm.png';
  static const String _excludePathKey = '${_iconPath}exclude.png';
  static const String _facebookPathKey = '${_iconPath}facebook.png';
  static const String _linkedinPathKey = '${_iconPath}linkedin.png';
  static const String _lithuaniaPathKey = '${_iconPath}lithuania.png';
  static const String _plusPathKey = '${_iconPath}plus.png';
  static const String _securitylogoPathKey = '${_iconPath}security_logo.png';
  static const String _ukrainePathKey = '${_iconPath}ukraine.png';

  /// Path to the SVG files
  static const String _pinIconPathKey = '${_svgPath}pin_icon.svg';

  /// HomeScreen
  static AppIcon get confirm => AppIcon(iconKey: _confirmPathKey);
  static AppIcon get exclude => AppIcon(iconKey: _excludePathKey);
  static AppIcon get facebook => AppIcon(iconKey: _facebookPathKey);
  static AppIcon get linkedin => AppIcon(iconKey: _linkedinPathKey);
  static AppIcon get lithuania => AppIcon(iconKey: _lithuaniaPathKey);
  static AppIcon get plus => AppIcon(iconKey: _plusPathKey);
  static AppIcon get securityLogo => AppIcon(iconKey: _securitylogoPathKey);
  static AppIcon get ukraine => AppIcon(iconKey: _ukrainePathKey);
  static AppIcon get pinIcon => AppIcon(iconKey: _pinIconPathKey);
}
