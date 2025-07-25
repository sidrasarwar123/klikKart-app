class FeeModel {
  final int total;
  final int submitted;
  final int pending;

  FeeModel({
    required this.total,
    required this.submitted,
    required this.pending,
  });

  factory FeeModel.fromMap(Map<String, dynamic> map) {
    return FeeModel(
      total: map['total'] ?? 0,
      submitted: map['submitted'] ?? 0,
      pending: map['pending'] ?? 0,
    );
  }
}
