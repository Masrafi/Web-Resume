
class TrainModel {
final String name;
final String address;
final String title;


TrainModel({
required this.name,
required this.address,
required this.title,

});

factory TrainModel.fromJson(Map<String, dynamic> json) {
return TrainModel(
name: json['name'] ,
address: json['address'],
title: json['title'],

);
}
}