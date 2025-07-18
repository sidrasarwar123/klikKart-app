class JobModel {
  final String title;
  final String company;
  final String location;
  final String companyLogoUrl;
  final String postedDate;
  final String matchInfo;

  JobModel({
    required this.title,
    required this.company,
    required this.location,
    required this.companyLogoUrl,
    required this.postedDate,
    required this.matchInfo,
  });

  factory JobModel.fromMap(Map<String, dynamic> data) {
    return JobModel(
      title: data['title'] ?? '',
      company: data['company'] ?? '',
      location: data['location'] ?? '',
      companyLogoUrl: data['companyLogoUrl'] ?? '',
      postedDate: data['postedDate'] ?? '',
      matchInfo: data['matchInfo'] ?? '',
    );
  }
}
