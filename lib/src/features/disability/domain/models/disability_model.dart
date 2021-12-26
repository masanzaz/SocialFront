import 'package:flutter/material.dart';

class DisabilityModel {
  String disability;
  int id;
  IconData iconData;
  bool isSelected;

  DisabilityModel({
    required this.disability,
    required this.id,
    required this.iconData,
    this.isSelected = false,
  });

  factory DisabilityModel.fromJson(Map<String, dynamic> json) => DisabilityModel(
    id: json["id"],
    iconData: IconData(int.parse(json["icon"]), fontFamily: 'MaterialIcons'),
      disability: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "icon": iconData,
    "name": disability,
  };
}
