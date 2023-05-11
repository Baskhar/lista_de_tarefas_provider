import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart';

extension ThemeExtention on BuildContext{
   Color get primaryColor => Theme.of(this).primaryColor;
   Color get primaryColorLight => Theme.of(this).primaryColorLight;
   Color get buttonColor => Theme.of(this).buttonColor;
   TextTheme get textTheme => Theme.of(this).textTheme;


   TextStyle get tilleStyle => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
   );
}