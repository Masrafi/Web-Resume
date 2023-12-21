
class ObjectiveModel {
final String title;


ObjectiveModel({
required this.title,

});

factory ObjectiveModel.fromJson(Map<String, dynamic> json) {
return ObjectiveModel(
title: json['text'] 
);
}
}