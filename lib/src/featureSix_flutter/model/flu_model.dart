
class FluModel {
final String text;


FluModel({
required this.text,
});

factory FluModel.fromJson(Map<String, dynamic> json) {
return FluModel(
text: json['text'] ,
);
}
}