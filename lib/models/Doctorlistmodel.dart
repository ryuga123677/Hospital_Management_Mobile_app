class Doctorlistmodel {
  Doctorlistmodel({
     required this.id,
    required this.username,
    required this.email,
    required this.hospitalname,
    required this.appointments,
    required this.died,
    required this.patienttreated,
    required this.currentlytreating,
    required this.patientreports,
    required this.v,});

  Doctorlistmodel.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    hospitalname = json['hospitalname'];
    if (json['appointments'] != null) {
      appointments = [];
      json['appointments'].forEach((v) {
        appointments.add(Dynamic.fromJson(v));
      });
    }
    if (json['died'] != null) {
      died = [];
      json['died'].forEach((v) {
        died.add(Dynamic.fromJson(v));
      });
    }
    patienttreated = json['patienttreated'] != null ? json['patienttreated'].cast<String>() : [];
    if (json['currentlytreating'] != null) {
      currentlytreating = [];
      json['currentlytreating'].forEach((v) {
        currentlytreating.add(Dynamic.fromJson(v));
      });
    }
    patientreports = json['patientreports'] != null ? json['patientreports'].cast<String>() : [];
    v = json['__v'];
  }
  String id;
  String username;
  String email;
  String hospitalname;
  List<dynamic> appointments;
  List<dynamic> died;
  List<String> patienttreated;
  List<dynamic> currentlytreating;
  List<String> patientreports;
  int v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['hospitalname'] = hospitalname;
    if (appointments != null) {
      map['appointments'] = appointments.map((v) => v.toJson()).toList();
    }
    if (died != null) {
      map['died'] = died.map((v) => v.toJson()).toList();
    }
    map['patienttreated'] = patienttreated;
    if (currentlytreating != null) {
      map['currentlytreating'] = currentlytreating.map((v) => v.toJson()).toList();
    }
    map['patientreports'] = patientreports;
    map['__v'] = v;
    return map;
  }

}