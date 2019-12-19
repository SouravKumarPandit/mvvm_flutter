import 'package:flutter/material.dart';

class SizeConfig {
  MediaQueryData _mediaQueryData;
  double screenWidth;
  double screenHeight;
  double _blockHeight = 0;
  double _blockWidth = 0;

  double textMultiplier;
  double imageSizeMultiplier;
  double heightMultiplier;
  double widthMultiplier;
  bool isPortrait = true;
  bool isMobilePortrait = false;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    double maxHeight = _mediaQueryData.size.height;
    double maxWidth = _mediaQueryData.size.width;

    Orientation orientation = _mediaQueryData.orientation;

    if (orientation == Orientation.portrait) {
      screenWidth = maxWidth;
      screenHeight = maxHeight;
      isPortrait = true;
      if (screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      screenWidth = maxHeight;
      screenHeight = maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = screenWidth / 100;
    _blockHeight = screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
  }

  void initConstrain(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = screenWidth / 100;
    _blockHeight = screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

//    print(_screenWidth);
  }
}
