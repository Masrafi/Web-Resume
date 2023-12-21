
class WorkExModel {
final String name;
final String play_store;
final String app_store;


WorkExModel({
required this.name,
required this.play_store,
required this.app_store,

});

factory WorkExModel.fromJson(Map<String, dynamic> json) {
return WorkExModel(
name: json['name'] ,
play_store: json['play_store'],
app_store: json['app_store'],
);
}
}