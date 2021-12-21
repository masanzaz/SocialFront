import 'package:dating/src/domain/models/APIServices.dart';
import 'package:dating/src/domain/models/hobbies/hobbyViewModel.dart';
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

  static List<InterestModel> items() {
    List<InterestModel> _list = [];
    _list.add(InterestModel(
        interest: "Photography", id: 1, iconData: Icons.camera_alt_outlined));
    _list.add(InterestModel(
        interest: "Shopping", id: 2, iconData: Icons.shopping_basket_outlined));
    _list.add(InterestModel(
        interest: "Karaoke", id: 3, iconData: Icons.mic_external_off_outlined));
    _list.add(InterestModel(
        interest: "Cooking", id: 4, iconData: Icons.food_bank_outlined));
    _list.add(InterestModel(
        interest: "Music", id: 5, iconData: Icons.music_note_outlined));
    _list.add(InterestModel(
        interest: "Movies", id: 6, iconData: Icons.movie_creation_outlined));
    _list.add(
        InterestModel(interest: "Drink", id: 7, iconData: FontAwesome5.beer));
    _list.add(InterestModel(
        interest: "Games", id: 8, iconData: Icons.videogame_asset_outlined));
    _list.add(InterestModel(
        interest: "Traveling", id: 9, iconData: Icons.travel_explore_outlined));
    _list.add(InterestModel(
        interest: "Drawing", id: 10, iconData: FontAwesome5.draw_polygon));
    _list.add(InterestModel(
        interest: "Sports", id: 11, iconData: FontAwesome5.basketball_ball));
    _list.add(
        InterestModel(interest: "Animal", id: 12, iconData: FontAwesome5.cat));
    return _list;
  }

  static List<HobbyViewModel> items2() {
    List<HobbyViewModel> _list = [];
    APIServices.fetchHobbies().then((response){
      Iterable jsonResponse = convert.jsonDecode(response.body);
      _list = jsonResponse.map((model) => HobbyViewModel.fromObject(model)).toList();
    });

    return _list;
  }
}
