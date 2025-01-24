import 'package:flutter/material.dart';

class ScreenSize {
  final BuildContext context;

  ScreenSize(this.context);

  // Screen width
  double get width => MediaQuery.of(context).size.width;

  // Screen height
  double get height => MediaQuery.of(context).size.height;

  // Padding (useful for safe area adjustments)
  EdgeInsets get padding => MediaQuery.of(context).padding;

  // ViewInsets (e.g., for keyboards)
  EdgeInsets get viewInsets => MediaQuery.of(context).viewInsets;

  // Device pixel ratio
  double get pixelRatio => MediaQuery.of(context).devicePixelRatio;

  // Orientation
  Orientation get orientation => MediaQuery.of(context).orientation;

  // Custom breakpoint-based logic
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  bool get isMobile => width < 600; // Adjust based on your app
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024;
}
