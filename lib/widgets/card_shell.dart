import 'package:flutter/material.dart';
import '../core/constants.dart';

class CardShell extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const CardShell({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [cardTop, cardBottom],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: stroke, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 18,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
