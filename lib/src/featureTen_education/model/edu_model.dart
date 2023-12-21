
class EduModel {
final String degree;
final String grade;
final String group;
final String institution;
final String year;

EduModel({
required this.degree,
required this.grade,
required this.group,
required this.institution,
required this.year,
});

factory EduModel.fromJson(Map<String, dynamic> json) {
return EduModel(
degree: json['degree'] ,
grade: json['grade'],
group: json['group'],
institution: json['institution'],
year: json['year'],
);
}
}