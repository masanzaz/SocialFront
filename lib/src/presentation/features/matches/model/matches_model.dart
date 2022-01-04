import 'package:dating/src/core/utils/resources/constants.dart';
import 'package:dating/src/core/utils/resources/resource.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';

class MatchesModel {
  int id;
  int age;
  String name;
  String image;
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
      about: json["about"]??'',
      location: json["city"]??'',
      distance: 0,
      passion: '',
      isFavourite : false
  );


  static List<DiscoverPersonalModel> items() => [
        DiscoverPersonalModel(
            id: 1,
            age: 23,
            name: "Jessica Parker",
            image: R.IMAGES_MODEL1_JPG,
            passion: "Musician",
            distance: 1,
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            location: 'Chicago'),
        DiscoverPersonalModel(
            id: 2,
            age: 24,
            name: "Camila Snow",
            image: R.IMAGES_MODEL2_JPG,
            passion: "Actress",
            distance: 5,
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            location: 'Chicago'),
        DiscoverPersonalModel(
            id: 3,
            age: 22,
            name: "Nancy Jones",
            image: R.IMAGES_MODEL3_JPG,
            passion: "Photographer",
            distance: 8,
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            isFavourite: true,
            location: 'Chicago'),
        DiscoverPersonalModel(
            id: 4,
            age: 23,
            name: "Jessica Parker",
            image: R.IMAGES_MODEL1_JPG,
            passion: "Musician",
            distance: 1,
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            location: 'Chicago'),
        DiscoverPersonalModel(
            id: 5,
            age: 24,
            name: "Camila Snow",
            image: R.IMAGES_MODEL2_JPG,
            passion: "Actress",
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            distance: 5,
            location: 'Chicago'),
        DiscoverPersonalModel(
            id: 6,
            age: 22,
            name: "Nancy Jones",
            image: R.IMAGES_MODEL3_JPG,
            passion: "Photographer",
            distance: 8,
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            isFavourite: true,
            location: 'Chicago'),
        DiscoverPersonalModel(
            id: 7,
            age: 23,
            name: "Jessica Parker",
            image: R.IMAGES_MODEL1_JPG,
            passion: "Musician",
            distance: 1,
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            location: 'Chicago'),
        DiscoverPersonalModel(
            id: 8,
            age: 24,
            name: "Camila Snow",
            image: R.IMAGES_MODEL2_JPG,
            passion: "Actress",
            distance: 5,
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            location: 'Chicago'),
        DiscoverPersonalModel(
            id: 9,
            age: 22,
            name: "Nancy Jones",
            image: R.IMAGES_MODEL3_JPG,
            passion: "Photographer",
            distance: 8,
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            isFavourite: true,
            location: 'Chicago')
      ];
}
