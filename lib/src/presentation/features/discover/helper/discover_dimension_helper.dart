import 'package:flutter/cupertino.dart';

class DiscoverDimensionHelper {
  final BuildContext context;

  DiscoverDimensionHelper({required this.context});

  static const double _pageViewWidthConst = 0.75;
  static const double _pageViewHeightConst = 0.55;
  static const double _firstCardOfStackWidthConst = 0.7;
  static const double _firstCardOfStackHeightConst = 0.56;
  static const double _secondCardOfStackWidthConst = 0.65;
  static const double _secondCardOfStackHeightConst = 0.567;

  double get _screenWidth => MediaQuery.of(context).size.width;

  double get _screenHeight => MediaQuery.of(context).size.height;

  double get pageViewWidth => _screenWidth * _pageViewWidthConst;

  double get pageViewHeight => _screenHeight * _pageViewHeightConst;

  double get firstCardOfStackWidth =>
      _screenWidth * _firstCardOfStackWidthConst;

  double get firstCardOfStackHeight =>
      _screenHeight * _firstCardOfStackHeightConst;

  double get secondCardOfStackWidth =>
      _screenWidth * _secondCardOfStackWidthConst;

  double get secondCardOfStackHeight =>
      _screenHeight * _secondCardOfStackHeightConst;
}
