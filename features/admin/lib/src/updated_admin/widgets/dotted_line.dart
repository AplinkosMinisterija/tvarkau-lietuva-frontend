library dotted_line;

import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({
    Key? key,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.center,
    this.lineLength = double.infinity,
    this.lineThickness = 1.0,
    this.dashLength = 4.0,
    this.dashColor = Colors.black,
    this.dashGradient,
    this.dashGapLength = 4.0,
    this.dashGapColor = Colors.transparent,
    this.dashGapGradient,
    this.dashRadius = 0.0,
    this.dashGapRadius = 0.0,
  })  : assert(
            dashGradient == null || dashGradient.length == 2,
            'The dashGradient must have only two colors.\n'
            'The beginning color and the ending color of the gradient.'),
        assert(
            dashGapGradient == null || dashGapGradient.length == 2,
            'The dashGapGradient must have only two colors.\n'
            'The beginning color and the ending color of the gradient.'),
        super(key: key);

  final Axis direction;

  final WrapAlignment alignment;

  final double lineLength;

  final double lineThickness;

  final double dashLength;

  final Color dashColor;

  final List<Color>? dashGradient;

  final double dashRadius;

  final double dashGapLength;

  final Color dashGapColor;

  final List<Color>? dashGapGradient;

  final double dashGapRadius;

  @override
  Widget build(BuildContext context) {
    final isHorizontal = direction == Axis.horizontal;

    return SizedBox(
      width: isHorizontal ? lineLength : lineThickness,
      height: isHorizontal ? lineThickness : lineLength,
      child: LayoutBuilder(builder: (context, constraints) {
        final lineLength = _getLineLength(constraints, isHorizontal);
        final dashAndDashGapCount = _calculateDashAndDashGapCount(lineLength);
        final dashCount = dashAndDashGapCount[0];
        final dashGapCount = dashAndDashGapCount[1];

        return Wrap(
          direction: direction,
          alignment: alignment,
          children: List.generate(dashCount + dashGapCount, (index) {
            if (index % 2 == 0) {
              final dashColor = _getDashColor(dashCount, index ~/ 2);
              final dash = _buildDash(isHorizontal, dashColor);
              return dash;
            } else {
              final dashGapColor = _getDashGapColor(dashGapCount, index ~/ 2);
              final dashGap = _buildDashGap(isHorizontal, dashGapColor);
              return dashGap;
            }
          }).toList(growable: false),
        );
      }),
    );
  }

  double _getLineLength(BoxConstraints constraints, bool isHorizontal) {
    return lineLength == double.infinity
        ? isHorizontal
            ? constraints.maxWidth
            : constraints.maxHeight
        : lineLength;
  }

  List<int> _calculateDashAndDashGapCount(double lineLength) {
    var dashAndDashGapLength = dashLength + dashGapLength;
    var dashCount = lineLength ~/ dashAndDashGapLength;
    var dashGapCount = lineLength ~/ dashAndDashGapLength;
    if (dashLength <= lineLength % dashAndDashGapLength) {
      dashCount += 1;
    }
    return [dashCount, dashGapCount];
  }

  Widget _buildDash(bool isHorizontal, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(dashRadius),
      ),
      width: isHorizontal ? dashLength : lineThickness,
      height: isHorizontal ? lineThickness : dashLength,
    );
  }

  Color _getDashColor(int maxDashCount, int index) {
    return dashGradient == null
        ? dashColor
        : _calculateGradientColor(
            dashGradient![0],
            dashGradient![1],
            maxDashCount,
            index,
          );
  }

  Widget _buildDashGap(bool isHorizontal, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(dashGapRadius),
      ),
      width: isHorizontal ? dashGapLength : lineThickness,
      height: isHorizontal ? lineThickness : dashGapLength,
    );
  }

  Color _getDashGapColor(int maxDashGapCount, int index) {
    return dashGapGradient == null
        ? dashGapColor
        : _calculateGradientColor(
            dashGapGradient![0],
            dashGapGradient![1],
            maxDashGapCount,
            index,
          );
  }

  Color _calculateGradientColor(
    Color startColor,
    Color endColor,
    int maxItemCount,
    int index,
  ) {
    var diffAlpha = (endColor.alpha - startColor.alpha);
    var diffRed = (endColor.red - startColor.red);
    var diffGreen = (endColor.green - startColor.green);
    var diffBlue = (endColor.blue - startColor.blue);

    var amountOfChangeInAlphaPerItem = diffAlpha ~/ maxItemCount;
    var amountOfChangeInRedPerItem = diffRed ~/ maxItemCount;
    var amountOfChangeInGreenPerItem = diffGreen ~/ maxItemCount;
    var amountOfChangeInBluePerItem = diffBlue ~/ maxItemCount;

    return startColor
        .withAlpha(startColor.alpha + amountOfChangeInAlphaPerItem * index)
        .withRed(startColor.red + amountOfChangeInRedPerItem * index)
        .withGreen(startColor.green + amountOfChangeInGreenPerItem * index)
        .withBlue(startColor.blue + amountOfChangeInBluePerItem * index);
  }
}
