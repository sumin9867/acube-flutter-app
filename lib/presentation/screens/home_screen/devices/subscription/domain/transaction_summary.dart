class TransactionSummary {
  final int transactionsCount;

  TransactionSummary({
    required this.transactionsCount,
  });

  factory TransactionSummary.fromJson(Map<String, dynamic> json) {
    return TransactionSummary(
      transactionsCount: json['transactionsCount'],
    );
  }
}
