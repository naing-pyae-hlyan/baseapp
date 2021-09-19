import 'dart:math';
import '../lib_exp.dart';

extension ContextExtensions on BuildContext {
  void pop() => Navigator.of(this).pop();

  Future<dynamic> push(Widget page) => Navigator.of(this).push(
        MaterialPageRoute(builder: (_) => page),
      );

  Future<dynamic> pushAndRemoveUntil(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page),
        (route) => false,
      );

  get queryData => MediaQuery.of(this);
  double get width => queryData.size.width;
  double get height => queryData.size.height;
  get minSize => min(width, height);
}
