import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/challenge_board_viewmodel.dart';
import 'views/challenge_board.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChallengeBoardViewModel()..loadChallenges(),
      child: MaterialApp(
        title: 'Challenge Board',
        debugShowCheckedModeBanner: false,
        home: const ChallengeBoard(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Challenge Board',
//       debugShowCheckedModeBanner: false,
//       home: const ChallengeBoard(),
//     );
//   }
// }

// /* ----------------------- THEME & HELPERS ----------------------- */

// const _bg = Color(0xFF081331);
// const _cardTop = Color(0xFF0D1D4E);
// const _cardBottom = Color(0xFF071641);
// const _stroke = Color(0x1AFFFFFF);
// const _chipBlue = Color(0xFF2A4BB0);
// const _chipPurple = Color(0xFF6F62F6);
// const _chipGreen = Color(0xFF2BB673);

// TextStyle _labelStyle(BuildContext c) =>
//     TextStyle(color: Colors.white.withOpacity(.65), fontSize: 13, height: 1.2);

// TextStyle _valueStyle([bool bold = false]) => TextStyle(
//   color: Colors.white,
//   fontSize: 13,
//   fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
//   height: 1.2,
// );

// String _money(num v) {
//   final s = v.toStringAsFixed(0);
//   final buf = StringBuffer();
//   for (int i = 0; i < s.length; i++) {
//     final r = s.length - i;
//     buf.write(s[i]);
//     if (r > 1 && r % 3 == 1) buf.write(',');
//   }
//   return "\$$buf";
// }

// Widget _sp(double h) => SizedBox(height: h);

// /* ----------------------- DATA MODEL ----------------------- */

// class ChallengeData {
//   final int amount;
//   final double balance;
//   final String boughtDate;
//   final String id;
//   final bool funded;
//   ChallengeData({
//     required this.amount,
//     required this.balance,
//     required this.boughtDate,
//     required this.id,
//     required this.funded,
//   });
// }

// /* ----------------------- RESPONSIVE BOARD ----------------------- */

// class ChallengeBoard extends StatelessWidget {
//   const ChallengeBoard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final items = <ChallengeData>[
//       ChallengeData(
//         amount: 5000,
//         balance: 6340,
//         boughtDate: "Mar 20, 2025",
//         id: "123456789FD",
//         funded: false, // On Challenge
//       ),
//       ChallengeData(
//         amount: 25000,
//         balance: 6340,
//         boughtDate: "Mar 20, 2025",
//         id: "123453Fdfd",
//         funded: true,
//       ),
//       ChallengeData(
//         amount: 10000,
//         balance: 6340,
//         boughtDate: "Mar 20, 2025",
//         id: "123456789FD",
//         funded: true,
//       ),
//     ];

//     return Scaffold(
//       backgroundColor: _bg,
//       body: LayoutBuilder(
//         builder: (context, c) {
//           final w = c.maxWidth;
//           final isDesktop = w >= 960;
//           if (!isDesktop) {
//             // ---------- MOBILE (first screenshot) ----------
//             return ListView.builder(
//               padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
//               itemCount: items.length,
//               itemBuilder:
//                   (_, i) => Padding(
//                     padding: EdgeInsets.only(
//                       bottom: i == items.length - 1 ? 0 : 16,
//                     ),
//                     child: MobileChallengeCard(
//                       key: ValueKey(i),
//                       data: items[i],
//                     ),
//                   ),
//             );
//           }
//           // ---------- DESKTOP (second screenshot) ----------
//           return SingleChildScrollView(
//             padding: const EdgeInsets.fromLTRB(28, 28, 28, 40),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Left column: two stacked cards
//                 Expanded(
//                   child: Column(
//                     children: [
//                       DesktopChallengeCard(
//                         key: const ValueKey('d0'),
//                         data: items[0],
//                       ),
//                       const SizedBox(height: 22),
//                       DesktopChallengeCard(
//                         key: const ValueKey('d1'),
//                         data: items[2],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 28),
//                 // Right column: one card aligned to top
//                 Expanded(
//                   child: DesktopChallengeCard(
//                     key: const ValueKey('d2'),
//                     data: items[1],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// /* ----------------------- BADGES / CHIPS ----------------------- */

// class Pill extends StatelessWidget {
//   final String text;
//   final Color color;
//   final bool outline;
//   final EdgeInsets padding;
//   final double fontSize;
//   final IconData? icon;
//   const Pill({
//     Key? key,
//     required this.text,
//     required this.color,
//     this.outline = false,
//     this.icon,
//     this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//     this.fontSize = 12,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final bg = outline ? color.withOpacity(.14) : color;
//     return Container(
//       padding: padding,
//       decoration: BoxDecoration(
//         color: bg,
//         borderRadius: BorderRadius.circular(14),
//         border: outline ? Border.all(color: color, width: 1) : null,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (icon != null) ...[
//             Icon(icon, size: fontSize + 1, color: Colors.white),
//             const SizedBox(width: 6),
//           ],
//           Text(
//             text,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: fontSize,
//               fontWeight: FontWeight.w600,
//               height: 1.0,
//               letterSpacing: .2,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* ----------------------- CARD BASE ----------------------- */

// class CardShell extends StatelessWidget {
//   final Widget child;
//   final EdgeInsets padding;
//   const CardShell({
//     Key? key,
//     required this.child,
//     this.padding = const EdgeInsets.all(18),
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [_cardTop, _cardBottom],
//         ),
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: _stroke, width: 1),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x33000000),
//             blurRadius: 18,
//             offset: Offset(0, 12),
//           ),
//         ],
//       ),
//       child: Padding(padding: padding, child: child),
//     );
//   }
// }

// /* ----------------------- MOBILE CARD ----------------------- */

// class MobileChallengeCard extends StatelessWidget {
//   final ChallengeData data;
//   const MobileChallengeCard({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CardShell(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // top row chips (left)
//           Row(
//             children: [
//               Pill(
//                 text: data.funded ? "Funded" : "On Challenge",
//                 color: data.funded ? _chipGreen : _chipBlue,
//               ),
//               const SizedBox(width: 8),
//               const Pill(text: "Evaluation 1", color: _chipPurple),
//               const Spacer(),
//             ],
//           ),
//           _sp(12),
//           // title + PRO mini pill on same line (mobile)
//           Row(
//             children: [
//               Text(
//                 "Two Step Challenge",
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.white.withOpacity(.88),
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               const Pill(
//                 text: "PRO",
//                 color: _chipPurple,
//                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                 fontSize: 10,
//               ),
//             ],
//           ),
//           _sp(8),
//           Text(
//             _money(data.amount),
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 30,
//               fontWeight: FontWeight.w800,
//               height: 1.1,
//             ),
//           ),
//           _sp(10),
//           Row(
//             children: [
//               Text("Balance :", style: _labelStyle(context)),
//               const SizedBox(width: 6),
//               Text(_money(data.balance), style: _valueStyle(true)),
//             ],
//           ),
//           _sp(6),
//           Row(
//             children: [
//               Text("Bought :", style: _labelStyle(context)),
//               const SizedBox(width: 6),
//               Text(data.boughtDate, style: _valueStyle()),
//               const SizedBox(width: 4),
//               Icon(
//                 Icons.info_outline,
//                 size: 14,
//                 color: Colors.white.withOpacity(.6),
//               ),
//             ],
//           ),
//           _sp(6),
//           Row(
//             children: [
//               Text("ID :", style: _labelStyle(context)),
//               const SizedBox(width: 6),
//               Text(data.id, style: _valueStyle(true)),
//             ],
//           ),
//           _sp(16),
//           SizedBox(
//             width: double.infinity,
//             height: 44,
//             child: ElevatedButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.dashboard_customize_outlined, size: 18),
//               label: const Text(
//                 "Dashboard",
//                 style: TextStyle(fontWeight: FontWeight.w600),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white.withOpacity(.92),
//                 foregroundColor: Colors.black,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 elevation: 0,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* ----------------------- DESKTOP CARD ----------------------- */

// class DesktopChallengeCard extends StatelessWidget {
//   final ChallengeData data;
//   const DesktopChallengeCard({Key? key, required this.data}) : super(key: key);

//   Widget _dot() => Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 10),
//     child: Container(
//       width: 5,
//       height: 5,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.28),
//         shape: BoxShape.circle,
//       ),
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return CardShell(
//       padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // first row: title left, status right
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title + PRO (left)
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const [
//                         Text(
//                           "Two Step Challenge",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16.5,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Pill(
//                           text: "PRO",
//                           color: _chipPurple,
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 2,
//                           ),
//                           fontSize: 10,
//                         ),
//                       ],
//                     ),
//                     _DesktopAmount(amount: _money(data.amount)),
//                   ],
//                 ),
//               ),
//               // Status (right)
//               Pill(
//                 text: data.funded ? "Funded" : "On Challenge",
//                 color: data.funded ? _chipGreen : _chipBlue,
//               ),
//             ],
//           ),
//           _sp(10),
//           // Inline metadata row with dot separators & a green-outlined Bought tag
//           Row(
//             children: [
//               Text("Balance :", style: _labelStyle(context)),
//               const SizedBox(width: 6),
//               Text(_money(data.balance), style: _valueStyle(true)),
//               _dot(),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                 decoration: BoxDecoration(
//                   color: _chipGreen.withOpacity(.15),
//                   borderRadius: BorderRadius.circular(6),
//                   border: Border.all(color: _chipGreen, width: 1),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("Bought ${data.boughtDate}", style: _valueStyle()),
//                   ],
//                 ),
//               ),
//               _dot(),
//               Text("ID :", style: _labelStyle(context)),
//               const SizedBox(width: 6),
//               Text(data.id, style: _valueStyle(true)),
//             ],
//           ),
//           _sp(12),
//           // stage chips row
//           Wrap(
//             spacing: 10,
//             runSpacing: 8,
//             children: const [
//               Pill(text: "Evaluation 1", color: _chipPurple),
//               Pill(text: "Evaluation 2", color: _chipPurple),
//               Pill(
//                 text: "Master Account",
//                 color: _chipBlue,
//                 icon: Icons.lock_outline,
//               ),
//             ],
//           ),
//           _sp(14),
//           // Dashboard bar
//           SizedBox(
//             height: 42,
//             child: ElevatedButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.dashboard_customize_outlined, size: 18),
//               label: const Text(
//                 "Dashboard",
//                 style: TextStyle(fontWeight: FontWeight.w600),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.black,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 elevation: 0,
//                 minimumSize: const Size.fromHeight(42),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _DesktopAmount extends StatelessWidget {
//   final String amount;
//   const _DesktopAmount({Key? key, required this.amount}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0, bottom: 6),
//       child: Text(
//         amount,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 32,
//           fontWeight: FontWeight.w800,
//           height: 1.1,
//           letterSpacing: .2,
//         ),
//       ),
//     );
//   }
// }
