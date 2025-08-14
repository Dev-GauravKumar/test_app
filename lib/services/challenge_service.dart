import 'dart:async';
import '../models/challenge_data.dart';

class ChallengeService {
  Future<List<ChallengeData>> fetchChallenges() async {
    // simulate network delay
    await Future.delayed(const Duration(milliseconds: 400));
    return [
      ChallengeData(
        amount: 5000,
        balance: 6340,
        boughtDate: "Mar 20, 2025",
        id: "123456789FD",
        funded: false,
      ),
      ChallengeData(
        amount: 25000,
        balance: 6340,
        boughtDate: "Mar 20, 2025",
        id: "123453Fdfd",
        funded: true,
      ),
      ChallengeData(
        amount: 10000,
        balance: 6340,
        boughtDate: "Mar 20, 2025",
        id: "123456789FD",
        funded: true,
      ),
    ];
  }
}
