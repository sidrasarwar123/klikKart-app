class StudentFeeModel {
  final int totalFee;
  final int submittedFee;
  final int pendingFee;

  StudentFeeModel({
    required this.totalFee,
    required this.submittedFee,
    required this.pendingFee,
  });

  factory StudentFeeModel.fromMap(Map<String, dynamic> map) {
    return StudentFeeModel(
      totalFee: map['totalFee'] ?? 0,
      submittedFee: map['submittedFee'] ?? 0,
      pendingFee: map['pendingFee'] ?? 0,
    );
  }
}
