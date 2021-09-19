import '../lib_exp.dart';

extension FlexibleExtensions on Widget {
  Widget get autoSize {
    return Flexible(child: this);
  }
}
