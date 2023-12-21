
class WorkModel {
final String company_name;
final String duration;
final String position;
final String products;
final String responsibilities;

WorkModel({
required this.company_name,
required this.duration,
required this.position,
required this.products,
required this.responsibilities,
});

factory WorkModel.fromJson(Map<String, dynamic> json) {
return WorkModel(
company_name: json['company_name'] ,
duration: json['duration'],
position: json['position'],
products: json['products'],
responsibilities: json['responsibilities'],
);
}
}