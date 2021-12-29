import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'dart:convert' as convert;

class InterestModel {
  String interest;
  int id;
  IconData iconData;
  bool isSelected;

  InterestModel({
    required this.interest,
    required this.id,
    required this.iconData,
    this.isSelected = false,
  });

  factory InterestModel.fromJson(Map<String, dynamic> json) => InterestModel(
    id: json["id"],
    iconData: IconData(int.parse(json["image"]), fontFamily: 'MaterialIcons'),
    interest: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": iconData,
    "name": interest,
  };
/*
  static List<InterestModel> items() {
    List<InterestModel> _list = [];
    _list.add(InterestModel(
        hobbie: "Photography", id: 1, iconData: Icons.camera_alt_outlined));
    _list.add(InterestModel(
        hobbie: "Shopping", id: 2, iconData: Icons.shopping_basket_outlined));
    _list.add(InterestModel(
        hobbie: "Karaoke", id: 3, iconData: Icons.mic_external_off_outlined));
    _list.add(InterestModel(
        hobbie: "Cooking", id: 4, iconData: Icons.food_bank_outlined));
    _list.add(InterestModel(
        hobbie: "Music", id: 5, iconData: Icons.music_note_outlined));
    _list.add(InterestModel(
        hobbie: "Movies", id: 6, iconData: Icons.movie_creation_outlined));
    _list.add(
        InterestModel(hobbie: "Drink", id: 7, iconData: FontAwesome5.beer));
    _list.add(InterestModel(
        hobbie: "Games", id: 8, iconData: Icons.videogame_asset_outlined));
    _list.add(InterestModel(
        hobbie: "Traveling", id: 9, iconData: Icons.travel_explore_outlined));
    _list.add(InterestModel(
        hobbie: "Drawing", id: 10, iconData: FontAwesome5.draw_polygon));
    _list.add(InterestModel(
        hobbie: "Sports", id: 11, iconData: FontAwesome5.basketball_ball));
    _list.add(
        InterestModel(hobbie: "Animal", id: 12, iconData: FontAwesome5.cat));
    return _list;
  }
*/
}
