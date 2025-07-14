import 'dart:ui';

Color hexToColor(String hexColor) {
  if (hexColor.isEmpty || hexColor.length < 6) {
    return const Color(0xFF000000); // Default color agar invalid ho
  }

  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor"; // Full opacity add karna
  }

  try {
    return Color(int.parse("0x$hexColor"));
  } catch (e) {
    return const Color(0xFF000000); // Agar parsing fail ho
  }
}
