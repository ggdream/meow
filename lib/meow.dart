library meow;

import 'package:flutter/material.dart';

class Meow {
  late final Widget app;

  void run() => runApp(app);
}

/// `Meow` global theme entry
/// It provides
class Theme {
  final Color? primaryColor;
  final Color? buttonColor;
  final InheritedTheme? buttonTheme;

  Theme({
    this.primaryColor,
    this.buttonColor,
    this.buttonTheme,
  });

  ColorScheme _genColorScheme(Color? primary) {
    return ColorScheme.light(
      primary: primary ?? Colors.black,
    );
  }

  build() {
    return ThemeData.from(colorScheme: _genColorScheme(primaryColor));
  }
}

class Router {
  
}
