
import 'package:dating/src/core/params/discover_parameter.dart';
import 'package:dating/src/core/utils/resources/constants.dart';
import 'package:dating/src/core/utils/resources/resource.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/features/person/domain/repositories/person_repository.dart';

class DiscoverPersonalModel {
  int id;
  int age;
  String name;
  String image;
  String passion;
  String location;
  String about;

  num distance;
  bool isFavourite;

  DiscoverPersonalModel(
      {required this.id,
      required this.age,
      required this.name,
      required this.image,
      required this.passion,
      required this.location,
      required this.distance,
      required this.about,
      this.isFavourite = false});

  factory DiscoverPersonalModel.fromJson(Map<String, dynamic> json) => DiscoverPersonalModel(
      id: json["id"],
      age: json["age"]??0,
      name: json["firstName"] +' '+ json["lasName"],
      image: ServerUrl + (json['image'] ?? ""),
      about: json["about"]??'',
      location: json["city"]??'',
      distance: 0,
      passion: '',
      isFavourite : false
  );

  static Future<List<DiscoverPersonalModel>> getItems() async {

    PersonRepository repo = new PersonRepositoryImpl();
    var person = await  repo.getPerson();
    DiscoverParameter params = new DiscoverParameter(personId: person.id??0);
    return await repo.discoverPersons(params);
  }

  static List<DiscoverPersonalModel> items() => [
        DiscoverPersonalModel(
            id: 1,
            age: 23,
            name: "Jessica Parker",
            image: R.IMAGES_MODEL1_JPG,
            passion: "Musician",
            location: "Chicago",
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            distance: 1),
        DiscoverPersonalModel(
            id: 2,
            age: 24,
            name: "Camila Snow",
            image: R.IMAGES_MODEL2_JPG,
            passion: "Actress",
            location: "Chicago",
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            distance: 5),
        DiscoverPersonalModel(
            id: 3,
            age: 22,
            name: "Nancy Jones",
            image: R.IMAGES_MODEL3_JPG,
            passion: "Photographer",
            location: "Chicago",
            about:
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
            distance: 8)
      ];
}
