part of 'app_theme.dart';

class AppIcon {
  static const String _packageName = 'core_ui';
  static const double _defaultIconSize = 24.0;
  static const BoxFit _defaultBoxFit = BoxFit.cover;

  final String iconKey;
  final String? semanticsLabel;

  bool get isSVG => iconKey.contains('svg');

  AppIcon({
    required this.iconKey,
    this.semanticsLabel,
  });

  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    assert(isSVG);

    return SvgPicture.asset(
      iconKey,
      package: _packageName,
      colorFilter: color != null
          ? ui.ColorFilter.mode(
              color,
              ui.BlendMode.srcIn,
            )
          : null,
      height: width,
      width: height,
      fit: fit ?? BoxFit.contain,
    );
  }

  Widget call({
    Color? color,
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    if (isSVG) {
      return SvgPicture.asset(
        iconKey,
        semanticsLabel: semanticsLabel,
        package: _packageName,
        colorFilter: color != null
            ? ui.ColorFilter.mode(
                color,
                ui.BlendMode.srcIn,
              )
            : null,
        height: height ?? _defaultIconSize,
        width: width ?? _defaultIconSize,
        fit: fit ?? _defaultBoxFit,
      );
    }

    return ImageIcon(
      AssetImage(
        iconKey,
        package: _packageName,
      ),
      semanticLabel: semanticsLabel,
      color: color,
      size: _defaultIconSize,
    );
  }
}
