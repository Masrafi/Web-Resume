
class RefModel {
final String name;
final String phone;
final String email;
final String degic;
final String organization;

RefModel({
required this.name,
required this.phone,
required this.email,
required this.degic,
required this.organization,
});

factory RefModel.fromJson(Map<String, dynamic> json) {
return RefModel(
name: json['name'] ,
phone: json['phone'],
email: json['email'],
degic: json['degic'],
organization: json['organization'],
);
}
}