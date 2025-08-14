import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  final String text;
  final Color? color;
  final bool outline;
  final EdgeInsets padding;
  final double fontSize;
  final IconData? icon;
  final BoxDecoration? decoration;
  final TextStyle? textStyle;
  const Pill({
    super.key,
    required this.text,
    this.color,
    this.outline = false,
    this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    this.fontSize = 12,
    this.decoration,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bg = outline ? color?.withOpacity(.14) : color;
    return Container(
      padding: padding,
      decoration:
          decoration ??
          BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(14),
            border:
                outline
                    ? Border.all(color: color ?? Colors.transparent, width: 1)
                    : null,
          ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: fontSize + 1, color: Colors.white),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style:
                textStyle ??
                TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  height: 1.0,
                  letterSpacing: .2,
                ),
          ),
        ],
      ),
    );
  }
}
