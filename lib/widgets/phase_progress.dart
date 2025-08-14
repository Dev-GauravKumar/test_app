import 'package:flutter/material.dart';

class PhaseProgress extends StatelessWidget {
  final int currentPhase;
  final int totalPhases;

  const PhaseProgress({
    super.key,
    required this.currentPhase,
    required this.totalPhases,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalPhases, (index) {
        final isActive = index == currentPhase;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        );
      }),
    );
  }
}
