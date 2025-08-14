import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/challenge_board_viewmodel.dart';
import '../widgets/mobile_challenge_card.dart';
import '../widgets/desktop_challenge_card.dart';
import '../core/constants.dart';

class ChallengeBoard extends StatelessWidget {
  const ChallengeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ChallengeBoardViewModel>(context);
    final items = vm.challenges;

    return Scaffold(
      backgroundColor: bg,
      body: LayoutBuilder(
        builder: (context, c) {
          final w = c.maxWidth;
          final isDesktop = w >= 1157;

          if (vm.isLoading) {
            // keep centered loader while fake API loads
            return const Center(child: CircularProgressIndicator());
          }

          if (!isDesktop) {
            // ---------- MOBILE (first screenshot) ----------
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
              itemCount: items.length,
              itemBuilder:
                  (_, i) => Padding(
                    padding: EdgeInsets.only(
                      bottom: i == items.length - 1 ? 0 : 16,
                    ),
                    child: MobileChallengeCard(
                      key: ValueKey(i),
                      data: items[i],
                    ),
                  ),
            );
          }
          // ---------- DESKTOP (second screenshot) ----------
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column: two stacked cards
                Expanded(
                  child: Column(
                    children: [
                      DesktopChallengeCard(
                        key: const ValueKey('d0'),
                        data: items[0],
                      ),
                      const SizedBox(height: 22),
                      DesktopChallengeCard(
                        key: const ValueKey('d1'),
                        data: items[2],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 28),
                // Right column: one card aligned to top
                Expanded(
                  child: DesktopChallengeCard(
                    key: const ValueKey('d2'),
                    data: items[1],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
