// To parse this JSON data, do
//
//     final reports = reportsFromJson(jsonString);

import 'dart:convert';

List<Reports> reportsFromJson(String str) =>
    List<Reports>.from(json.decode(str).map((x) => Reports.fromJson(x)));

String reportsToJson(List<Reports> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reports {
  Reports({
    this.id,
    this.fullName,
    this.contact,
    this.email,
    this.symptom,
  });

  int id;
  String fullName;
  String contact;
  String email;
  String symptom;

  factory Reports.fromJson(Map<String, dynamic> json) => Reports(
        id: json["id"],
        fullName: json["full_name"],
        contact: json["contact"],
        email: json["email"],
        symptom: json["symptom"] == null ? null : json["symptom"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "contact": contact,
        "email": email,
        "symptom": symptom == null ? null : symptom,
      };
}
