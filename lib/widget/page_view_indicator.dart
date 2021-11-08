import 'package:azkar_app2/constance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  PageViewIndicator({
    required this.controller,
    this.itemCount = 0,
  });

  /// PageView Controller
  final PageController controller;

  /// Number of indicators
  final int itemCount;

  /// Ordinary colours
  final Color normalColor = greyTextColor;

  /// Selected color
  final Color selectedColor = primarySwatch;

  /// Size of points
  final double size = 6.0;

  /// Spacing of points
  final double spacing = 2.0;

  /// Point Widget
  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // Is the current page selected?
    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page!.round() % pageCount : 0);

    return SizedBox(
      height: size,
      width: size + (2 * spacing),
      child: Center(
        child: Material(
          color: isCurrentPageSelected ? selectedColor : normalColor,
          type: MaterialType.circle,
          child: SizedBox(
            width: dotSize,
            height: dotSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}
