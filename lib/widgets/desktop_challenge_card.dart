import 'package:flutter/material.dart';
import '../models/challenge_data.dart';
import 'card_shell.dart';
import 'pill.dart';
import '../core/constants.dart';

class DesktopChallengeCard extends StatelessWidget {
  final ChallengeData data;
  const DesktopChallengeCard({super.key, required this.data});

  Widget _dot() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.28),
        shape: BoxShape.circle,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CardShell(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // first row: title left, status right
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title + PRO (left)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Two Step Challenge",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 8),
                        Pill(
                          text: "PRO",
                          color: chipPurple,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          fontSize: 10,
                        ),
                      ],
                    ),
                    DesktopAmount(amount: money(data.amount)),
                  ],
                ),
              ),
              // Status (right)
              Pill(
                text: data.funded ? "Funded" : "On Challenge",
                color: data.funded ? chipGreen : chipBlue,
              ),
            ],
          ),
          sp(10),
          // Inline metadata row with dot separators & a green-outlined Bought tag
          Row(
            children: [
              Text("Balance :", style: labelStyle(context)),
              const SizedBox(width: 6),
              Text(money(data.balance), style: valueStyle(true)),
              _dot(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: chipGreen.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: chipGreen, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Bought ${data.boughtDate}", style: valueStyle()),
                  ],
                ),
              ),
              _dot(),
              Text("ID :", style: labelStyle(context)),
              const SizedBox(width: 6),
              Text(data.id, style: valueStyle(true)),
            ],
          ),
          sp(12),
          // stage chips row
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: const [
              Pill(text: "Evaluation 1", color: chipPurple),
              Pill(text: "Evaluation 2", color: chipPurple),
              Pill(
                text: "Master Account",
                color: chipBlue,
                icon: Icons.lock_outline,
              ),
            ],
          ),
          sp(14),
          // Dashboard bar
          SizedBox(
            height: 42,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.dashboard_customize_outlined, size: 18),
              label: const Text(
                "Dashboard",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                minimumSize: const Size.fromHeight(42),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopAmount extends StatelessWidget {
  final String amount;
  const DesktopAmount({super.key, required this.amount});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 6),
      child: Text(
        amount,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w800,
          height: 1.1,
          letterSpacing: .2,
        ),
      ),
    );
  }
}
