import 'dart:ui' show Color;

extension StringExtension on String {
  Color get color {
    var newString = this;
    switch (length) {
      case 7:
        newString = replaceFirst('#', 'FF');
      case 9:
        newString = replaceFirst('#', '');
      default:
        throw Exception('Invalid Color');
    }
    return Color(int.parse(newString, radix: 16));
  }
}
