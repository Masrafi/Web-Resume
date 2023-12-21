
class OtherModel {
final String app_work;
final String database;
final String ide;
final String others;
final String pro_manag;
final String swift;
final String sof_metho;
final String team_prac;
final String third_party;

OtherModel({
required this.app_work,
required this.database,
required this.ide,
required this.others,
required this.pro_manag,
required this.sof_metho,
required this.swift,
required this.team_prac,
required this.third_party,
});

factory OtherModel.fromJson(Map<String, dynamic> json) {
return OtherModel(
app_work: json['app_work'] ,
database: json['database'],
ide: json['ide'],
others: json['others'],
pro_manag: json['pro_manag'],
sof_metho: json['sof_metho'],
swift: json['swift'],
team_prac: json['team_prac'],
third_party: json['third_party'],
);
}
}