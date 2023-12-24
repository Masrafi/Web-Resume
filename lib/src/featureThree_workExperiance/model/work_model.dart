
class WorkModel {
final String company_name;
final String duration;
final String position;
final String products;
final Responsibilities responsibilities;

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
responsibilities: Responsibilities.fromJson(json['responsibilities']),
);
}
}

class Responsibilities{
  final String a;
  final String b;
  final String c;
  final String d;
  final String e;
  Responsibilities({required this.a, required this.b, required this.c, required this.d, required this.e});

factory Responsibilities.fromJson(Map<dynamic, dynamic> json) => Responsibilities(
   a: json['a'],
   b: json['b'],
   c: json['c'],
   d: json['d'],
   e: json['e'],
  );
}