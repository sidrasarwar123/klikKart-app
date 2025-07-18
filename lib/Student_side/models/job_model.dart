// class JobModel {
//   final String jobId;
//   final String title;
//   final String company;
//   final String companyLogoUrl;
//   final String location;
//   final int match;

//   JobModel({
//     required this.jobId,
//     required this.title,
//     required this.company,
//     required this.companyLogoUrl,
//     required this.location,
//     required this.match,
//   });

//   factory JobModel.fromMap(Map<String, dynamic> map) {
//     return JobModel(
//       jobId: map['jobId'] ?? '',
//       title: map['title'] ?? '',
//       company: map['company'] ?? '',
//       companyLogoUrl: map['companyLogoUrl'] ?? '',
//       location: map['location'] ?? '',
//       match: map['matchInfo'] ?? 0, // or just 'match'
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'jobId': jobId,
//       'title': title,
//       'company': company,
//       'companyLogoUrl': companyLogoUrl,
//       'location': location,
//       'matchInfo': match,
//     };
//   }

//   // Optional custom getter
//   String get showMatchInfo => "$match% Match";
// }
