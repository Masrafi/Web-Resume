
class PerModel {
final String a_permanent;
final String a_persent;
final String d_birth;
final String f_name;
final String gender;
final String m_name;
final String m_status;
final String nationality;
final String nid;
final String religion;

PerModel({
required this.a_permanent,
required this.a_persent,
required this.d_birth,
required this.f_name,
required this.gender,
required this.m_name,
required this.m_status,
required this.nationality,
required this.nid,
required this.religion,
});

factory PerModel.fromJson(Map<String, dynamic> json) {
return PerModel(
a_permanent: json['a_permanent'] ,
a_persent: json['a_persent'],
d_birth: json['d_birth'],
f_name: json['f_name'],
gender: json['gender'],
m_name: json['m_name'],
m_status: json['m_status'],
nationality: json['nationality'],
nid: json['nid'],
religion: json['religion'],
);
}
}