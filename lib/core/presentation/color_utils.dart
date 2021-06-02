import 'dart:ui';

/// Utility methods of [Color]
abstract class ColorUtil {
  /// Converts String hex to the Color class 
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