// To parse this JSON data, do
//
//     final searchStateModel = searchStateModelFromJson(jsonString);

import 'dart:convert';

SearchStateModel searchStateModelFromJson(String str) =>
    SearchStateModel.fromJson(json.decode(str));

String searchStateModelToJson(SearchStateModel data) =>
    json.encode(data.toJson());

class SearchStateModel {
  SearchStateModel({
    this.sts,
    this.msg,
    this.states,
  });

  String? sts;
  String? msg;
  List<StateModel>? states;

  factory SearchStateModel.fromJson(Map<String, dynamic> json) =>
      SearchStateModel(
        sts: json["sts"],
        msg: json["msg"],
        states: List<StateModel>.from(
            json["states"].map((x) => StateModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "states": List<dynamic>.from(states!.map((x) => x.toJson())),
      };
}

class StateModel {
  StateModel({
    this.id,
    this.country,
    this.name,
  });

  int? id;
  int? country;
  String? name;

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["id"],
        country: json["country"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "name": name,
      };
}
