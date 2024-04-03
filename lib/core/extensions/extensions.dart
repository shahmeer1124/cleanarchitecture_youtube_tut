import 'package:flutter/cupertino.dart';

extension contextExtension on BuildContext{
  MediaQueryData  get mediaQueryData=> MediaQuery.of(this);
  Size get size=>mediaQueryData.size;
  double get width=>size.width;
  double get height=>size.height;
}