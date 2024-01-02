
class FluModel {
final String a_work;
final String database;
final Flutter flutter;
final String ide;
final Language language;
final String other;
final String pro_manag;
final String sof_metho;
final String swift;
final String t_party;
final String exception_handle;
final String testing;
final TeamPer team_par;


FluModel({
required this.a_work,
required this.database,
required this.flutter,
required this.ide,
required this.language,
required this.other,
required this.pro_manag,
required this.sof_metho,
required this.swift,
required this.t_party,
required this.exception_handle,
required this.testing,
required this.team_par,
});

factory FluModel.fromJson(Map<String, dynamic> json) {
return FluModel(
a_work: json['a_work'] ,
database: json['database'] ,
flutter: Flutter.fromJson(json['flutter']) ,
ide: json['ide'] ,
language: Language.fromJson(json['language']) ,
other: json['other'] ,
pro_manag: json['pro_manag'] ,
sof_metho: json['sof_metho'] ,
swift: json['swift'] ,
exception_handle: json['exception_handle'] ,
testing: json['testing'] ,
t_party: json['t_party'] ,
team_par: TeamPer.fromJson(json['team_par']) ,
);
}
}

class Flutter {
final String f1;
final String f2;
final String f3;
final String f4;
final String f5;
final String f6;
final String f7;
final String f8;
final String f9;
final String f10;
final String f11;
final String f12;


Flutter({
required this.f1,
required this.f2,
required this.f3,
required this.f4,
required this.f5,
required this.f6,
required this.f7,
required this.f8,
required this.f9,
required this.f10,
required this.f11,
required this.f12,
});

factory Flutter.fromJson(Map<String, dynamic> json) {
return Flutter(
f1: json['f1'] ,
f2: json['f2'] ,
f3: json['f3'] ,
f4: json['f4'] ,
f5: json['f5'] ,
f6: json['f6'] ,
f7: json['f7'] ,
f8: json['f8'] ,
f9: json['f9'] ,
f10: json['f10'] ,
f11: json['f11'] ,
f12: json['f12'] ,
);
}
}

class Language {
final String f1;
final String f2;


Language({
required this.f1,
required this.f2,

});

factory Language.fromJson(Map<String, dynamic> json) {
return Language(
f1: json['f1'] ,
f2: json['f2'],

);
}
}


class TeamPer {
final String f1;
final String f2;
final String f3;


TeamPer({
required this.f1,
required this.f2,
required this.f3,

});

factory TeamPer.fromJson(Map<String, dynamic> json) {
return TeamPer(
f1: json['f1'] ,
f2: json['f2'],
f3: json['f3'],
);
}
}