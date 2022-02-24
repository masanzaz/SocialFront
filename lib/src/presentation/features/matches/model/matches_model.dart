import 'package:dating/src/core/utils/resources/constants.dart';
import 'package:dating/src/core/utils/resources/resource.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';

class MatchesModel {
  int id;
  int age;
  String name;
  String image;
  String matchImage;
  String passion;
  String location;
  String about;
  num distance;
  bool isFavourite;
  MatchesModel(
      {required this.id,
        required this.age,
        required this.name,
        required this.image,
        required this.matchImage,
        required this.passion,
        required this.location,
        required this.distance,
        required this.about,
        this.isFavourite = false});

  factory MatchesModel.fromJson(Map<String, dynamic> json) => MatchesModel(
      id: json["matchId"],
      age: json["age"]??0,
      name: json["firstName"] +' '+ json["lasName"],
      image: ServerUrl + (json['image'] ?? ""),
      matchImage: ServerUrl + (json['matchImage'] ?? ""),
      about: json["about"]??'',
      location: json["city"]??'',
      distance: 0,
      passion: '',
      isFavourite : false
  );
}
