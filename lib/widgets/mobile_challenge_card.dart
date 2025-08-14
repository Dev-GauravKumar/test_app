import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/challenge_data.dart';
import 'card_shell.dart';
import 'pill.dart';
import '../core/constants.dart';

class MobileChallengeCard extends StatelessWidget {
  final ChallengeData data;
  const MobileChallengeCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row chips (left)
          Row(
            children: [
              data.funded
                  ? Pill(
                    text: "Funded",
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff75DFA7),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff053321),
                      border: Border.all(color: Color(0xff75DFA7)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )
                  : Pill(
                    text: "On Challenge",

                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff80A4FE),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff11285F),
                      border: Border.all(color: Color(0xff80A4FE)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
              const SizedBox(width: 8),
              Pill(
                icon:
                    data.funded ? Icons.bar_chart_rounded : Icons.lock_rounded,
                text: data.funded ? "Evaluation 1" : "Master Account",
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff5865F2),
                      Color(0xff5865F2).withOpacity(0.4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Color(0xff5865F2)),
                ),
              ),
              const Spacer(),
            ],
          ),
          sp(12),
          // title + PRO mini pill on same line (mobile)
          Row(
            children: [
              Text(
                "Two Step Challenge",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Pill(
                text: "PRO",
                textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffCCDBFF),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff0249FE).withOpacity(0.4),
                      Color(0xff80A4FE).withOpacity(0.5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Color(0xff80A4FE)),
                ),
              ),
            ],
          ),
          sp(8),
          Text(
            money(data.amount),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          sp(10),
          Row(
            children: [
              Text("Balance :", style: labelStyle(context)),
              const SizedBox(width: 6),
              Text(money(data.balance), style: valueStyle(true)),
            ],
          ),
          sp(6),
          Row(
            children: [
              Text("Bought :", style: labelStyle(context)),
              const SizedBox(width: 6),
              Text(data.boughtDate, style: valueStyle()),
              const SizedBox(width: 4),
              Icon(
                Icons.info_outline,
                size: 14,
                color: Colors.white.withOpacity(0.5),
              ),
            ],
          ),
          sp(6),
          Row(
            children: [
              Text("ID :", style: labelStyle(context)),
              const SizedBox(width: 6),
              Text(data.id, style: valueStyle(true)),
            ],
          ),
          sp(16),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xffCCDBFF), Colors.white],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("/images/dashboardIcon.svg"),
                SizedBox(width: 5),
                const Text(
                  "Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
