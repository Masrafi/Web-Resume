
class ProjModel {
final String link;
final String title;


ProjModel({
required this.link,
required this.title,

});

factory ProjModel.fromJson(Map<String, dynamic> json) {
return ProjModel(
link: json['link'] ,
title: json['title'],

);
}
}