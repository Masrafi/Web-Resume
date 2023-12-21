
class CerModel {
final String title;
final String discribtion;


CerModel({
required this.title,
required this.discribtion,

});

factory CerModel.fromJson(Map<String, dynamic> json) {
return CerModel(
title: json['title'] ,
discribtion: json['discribtion'],

);
}
}