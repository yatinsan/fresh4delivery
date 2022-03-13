import 'dart:convert';

class PincodeModel {
  PincodeModel({
    required this.text,
  });

  String text;

  factory PincodeModel.fromJson(Map<String, dynamic> json) => PincodeModel(
        text: json["text"],
      );
}
