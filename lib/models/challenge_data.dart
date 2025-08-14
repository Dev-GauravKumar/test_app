class ChallengeData {
  final int amount;
  final double balance;
  final String boughtDate;
  final String id;
  final bool funded;

  ChallengeData({
    required this.amount,
    required this.balance,
    required this.boughtDate,
    required this.id,
    required this.funded,
  });

  // factory fromJson if you later wire real API:
  factory ChallengeData.fromJson(Map<String, dynamic> json) => ChallengeData(
    amount: json['amount'] as int,
    balance: (json['balance'] as num).toDouble(),
    boughtDate: json['boughtDate'] as String,
    id: json['id'] as String,
    funded: json['funded'] as bool,
  );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'balance': balance,
    'boughtDate': boughtDate,
    'id': id,
    'funded': funded,
  };
}
