import 'package:dating/src/domain/const/resource.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';

class MatchesModel {
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
