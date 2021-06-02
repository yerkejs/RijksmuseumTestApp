import 'dart:ui';

abstract class ColorUtil {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.toUpperCase()
      .replaceAll("#", "")
      .replaceAll(" ", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    
    return Color(int.parse(hexColor, radix: 16));
  }
}