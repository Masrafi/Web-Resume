
class CertModel {
final String name;
final String title;


CertModel({
required this.name,
required this.title,

});

factory CertModel.fromJson(Map<String, dynamic> json) {
return CertModel(
name: json['name'] ,
title: json['title'],

);
}
}