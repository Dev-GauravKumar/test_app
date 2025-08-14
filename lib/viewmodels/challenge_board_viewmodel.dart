import 'package:flutter/foundation.dart';
import '../models/challenge_data.dart';
import '../services/challenge_service.dart';

class ChallengeBoardViewModel extends ChangeNotifier {
  final ChallengeService _service = ChallengeService();

  List<ChallengeData> challenges = [];
  bool isLoading = true;

  Future<void> loadChallenges() async {
    isLoading = true;
    notifyListeners();
    try {
      challenges = await _service.fetchChallenges();
    } catch (e) {
      challenges = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
