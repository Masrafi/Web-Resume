
class IntroModel {
final String name;
final String mobile;
final String email;
final String skype;
final String linkedIn;
final String address;

IntroModel({
required this.name,
required this.mobile,
required this.email,
required this.skype,
required this.linkedIn,
required this.address,
});

factory IntroModel.fromJson(Map<String, dynamic> json) {
return IntroModel(
name: json['name'] ,
mobile: json['mobile'],
email: json['email'],
skype: json['skype'],
linkedIn: json['linkedIn'],
address: json['address'],
);
}
}