import 'package:core_ui/src/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _BottomSlideRouteLayout extends SingleChildLayoutDelegate {
  final double progress;
  final double customHeight;

  _BottomSlideRouteLayout(
    this.progress,
    this.customHeight,
  );

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0,
      maxHeight: customHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(1, (childSize.height * 2) - childSize.height * progress);
  }

  @override
  bool shouldRelayout(_BottomSlideRouteLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}

class _BottomSlideRouteBody<T> extends StatelessWidget {
  final double customHeight;
  final BottomSlideRoute<T> route;

  const _BottomSlideRouteBody({
    required this.customHeight,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: route.animation!,
      child: route.builder!(context),
      builder: (_, Widget? child) {
        final double animationValue = route.animation!.value;

        return ClipRect(
          child: CustomSingleChildLayout(
            delegate: _BottomSlideRouteLayout(animationValue, customHeight),
            child: child,
          ),
        );
      },
    );
  }
}

class BottomSlideRoute<T> extends PopupRoute<T> {
  final double customHeight;

  BottomSlideRoute({
    required this.customHeight,
    required this.builder,
    this.barrierLabel,
    this.modalBarrierColor,
    this.isDismissible = true,
    RouteSettings? settings,
  }) : super(settings: settings);

  final WidgetBuilder? builder;
  final Color? modalBarrierColor;
  final bool isDismissible;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 400);

  @override
  bool get barrierDismissible => isDismissible;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => AppTheme.accentDividerColor;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _BottomSlideRouteBody<T>(
      route: this,
      customHeight: customHeight,
    );
  }
}
