
class LanguageModel {
final String text;


LanguageModel({
required this.text,
});

factory LanguageModel.fromJson(Map<String, dynamic> json) {
return LanguageModel(
text: json['text'] ,

);
}
}