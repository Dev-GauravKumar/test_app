import 'package:flutter/material.dart';

const bg = Color(0xFF081331);
const cardTop = Color(0xFF0D1D4E);
const cardBottom = Color(0xFF071641);
const stroke = Color(0x1AFFFFFF);
const chipBlue = Color(0xFF2A4BB0);
const chipPurple = Color(0xFF6F62F6);
const chipGreen = Color(0xFF2BB673);

TextStyle labelStyle(BuildContext c) => TextStyle(
  color: Colors.white.withOpacity(.5),
  fontSize: 15,
  height: 1,
  fontWeight: FontWeight.w400,
);

TextStyle valueStyle([bool bold = true]) => TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
  height: 1.2,
);

String money(num v) {
  final s = v.toStringAsFixed(0);
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    final r = s.length - i;
    buf.write(s[i]);
    if (r > 1 && r % 3 == 1) buf.write(',');
  }
  return "\$$buf";
}

Widget sp(double h) => SizedBox(height: h);
