class JobModel {
  final String jobId;
  final String title;
  final String company;
  final String location;
  final String matchInfo;
  final String daysAgo;
  final String jobType;
  final String industry;
  final List<String> skills;
  final String description;
  final String responsibilities;
  final String companyLogoUrl;

  JobModel({
    required this.jobId,
    required this.title,
    required this.company,
    required this.location,
    required this.matchInfo,
    required this.daysAgo,
    required this.jobType,
    required this.industry,
    required this.skills,
    required this.description,
    required this.responsibilities,
    required this.companyLogoUrl,
  });

 factory JobModel.fromMap(Map<String, dynamic> map, String docId) {
  return JobModel(
    jobId: docId,
    title: map['title'] ?? '',
    company: map['company'] ?? '',
    location: map['location'] ?? '',
   matchInfo: map['matchInfo'] ?? '',
    daysAgo: map['daysAgo'] ?? '',
    jobType: map['jobType'] ?? '',
    industry: map['industry'] ?? '',
    skills: map['skills'] is List
        ? List<String>.from(map['skills'])
        : (map['skills'] as String)
            .split(',')
            .map((skill) => skill.trim())
            .toList(),
    description: map['description'] ?? '',
    responsibilities: map['responsibilities'] ?? '',
    companyLogoUrl: map['companyLogoUrl'] ?? '',
  );
}
}
