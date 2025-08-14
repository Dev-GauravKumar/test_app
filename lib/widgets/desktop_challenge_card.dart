import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        color: Colors.white.withOpacity(0.8),
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
                      children: [
                        Text(
                          "Two Step Challenge",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8),
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
                    DesktopAmount(amount: money(data.amount)),
                  ],
                ),
              ),
              // Status (right)
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Bought ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  Text(
                    data.boughtDate,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.9),
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.white.withOpacity(0.5),
                    size: 15,
                  ),
                ],
              ),
              _dot(),
              Text("ID :", style: labelStyle(context)),
              const SizedBox(width: 6),
              Text(data.id, style: valueStyle(true)),
              SizedBox(width: 5),
              Icon(
                Icons.info_outline_rounded,
                color: Colors.white.withOpacity(0.5),
                size: 15,
              ),
            ],
          ),
          sp(12),
          // stage chips row
          Wrap(
            spacing: 5,
            runSpacing: 8,
            children: [
              Pill(
                text: "Evaluation 1",
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
              Text(
                '-----------------',
                style: TextStyle(color: Colors.white.withOpacity(0.2)),
              ),
              Pill(
                text: "Evaluation 2",
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
              Text(
                '-----------------',
                style: TextStyle(color: Colors.white.withOpacity(0.2)),
              ),
              Pill(
                text: "Master Account",
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
              icon: SvgPicture.asset("/images/dashboardIcon.svg"),
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
        style: TextStyle(
          height: 1,
          fontSize: 47,
          letterSpacing: 2,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
