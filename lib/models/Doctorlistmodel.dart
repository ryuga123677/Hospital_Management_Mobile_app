class Doctorlistmodel {
  String? sId;
  String? username;
  String? email;
  String? hospitalname;
  List<String>? appointments;
  List<String>? died;
  List<String>? patienttreated;
  List<String>? currentlytreating;
  List<String>? patientreports;
  int? iV;

  Doctorlistmodel(
      {this.sId,
        this.username,
        this.email,
        this.hospitalname,
        this.appointments,
        this.died,
        this.patienttreated,
        this.currentlytreating,
        this.patientreports,
        this.iV});

  Doctorlistmodel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    hospitalname = json['hospitalname'];
    appointments = json['appointments'].cast<String>();
    died = json['died'].cast<String>();
    patienttreated = json['patienttreated'].cast<String>();
    currentlytreating = json['currentlytreating'].cast<String>();
    patientreports = json['patientreports'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['hospitalname'] = this.hospitalname;
    data['appointments'] = this.appointments;
    data['died'] = this.died;
    data['patienttreated'] = this.patienttreated;
    data['currentlytreating'] = this.currentlytreating;
    data['patientreports'] = this.patientreports;
    data['__v'] = this.iV;
    return data;
  }
}