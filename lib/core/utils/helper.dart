import 'package:flutter/material.dart';

///size of the display
Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

///height of the display
double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

///width of the display
double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

///height of the display minus the appbar
double displayHeightWithAppbar(BuildContext context) {
  return displaySize(context).height - kToolbarHeight;
}

///display height minus the top padding
double displayHeightWithPadding(BuildContext context) {
  return displaySize(context).height - MediaQuery.of(context).padding.top;
}

///display height minus the bottom navigation bar
double displayHeightWithBottomNavigationBar(BuildContext context) {
  return displaySize(context).height - kBottomNavigationBarHeight;
}

///display height minus the appBar and top padding
double displayHeightWithAppbarAndPadding(BuildContext context) {
  return displaySize(context).height -
      MediaQuery.of(context).padding.top -
      kToolbarHeight;
}

///display height minos the top padding,
/// bottom navigation bar and appBar
double displayHeightWithAppbarPaddingAndBotNav(BuildContext context) {
  return displaySize(context).height -
      MediaQuery.of(context).padding.top -
      kToolbarHeight -
      kBottomNavigationBarHeight;
}

///display height minus the bottom
///naviagtion bar and the top padding
double displayHeightWithPaddingAndBotNav(BuildContext context) {
  return displaySize(context).height -
      kBottomNavigationBarHeight -
      MediaQuery.of(context).padding.top;
}

///display height minus the appBar
///and the bottom naviagtion bar
double displayHeightWithAppbarAndBotNav(BuildContext context) {
  return displaySize(context).height -
      kBottomNavigationBarHeight -
      kToolbarHeight;
}
