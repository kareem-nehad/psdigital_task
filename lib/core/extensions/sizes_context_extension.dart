import 'package:flutter/material.dart';

extension SizesContextExtension on BuildContext {
  /// [size] Ranges from 0.0 to 1.0 (Percentage of given property)
  double rHeight(double size) => MediaQuery.sizeOf(this).height * size;

  /// [size] Ranges from 0.0 to 1.0 (Percentage of given property)
  double rWidth(double size) => MediaQuery.sizeOf(this).width * size;
}
