import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color orangeA100 = fromHex('#ffcf6f');

  static Color blueGray200 = fromHex('#bbc3ce');

  static Color blue2007f = fromHex('#7f9dceff');

  static Color gray500 = fromHex('#aca3a5');

  static Color blueGray50 = fromHex('#f0eff8');

  static Color blueGray400 = fromHex('#888888');

  static Color deepPurpleA1004c = fromHex('#4cc58bf2');

  static Color indigo50 = fromHex('#e4e3f2');

  static Color gray900 = fromHex('#1d1517');

  static Color gray90001 = fromHex('#130f26');

  static Color indigoA100 = fromHex('#92a3fd');

  static Color black9003f = fromHex('#3f000000');

  static Color gray200 = fromHex('#ebe6e6');

  static Color gray50 = fromHex('#f7f8f8');

  static Color blueGray20067 = fromHex('#67bbc3ce');

  static Color blue20000 = fromHex('#009dceff');

  static Color indigo100 = fromHex('#b3bffd');

  static Color black90001 = fromHex('#070821');

  static Color black900 = fromHex('#000000');

  static Color deepPurpleA100 = fromHex('#c58bf2');

  static Color blue200 = fromHex('#9dceff');

  static Color blueGray900 = fromHex('#333333');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigoA1004c = fromHex('#4c95adfe');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
