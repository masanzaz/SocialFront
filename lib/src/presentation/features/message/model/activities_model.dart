import 'package:dating/src/domain/const/resource.dart';

class ActivitiesModel {
  final int id;
  final String name;
  final String userProfile;
  final String image;
  final bool isSeen;

  ActivitiesModel(
      {required this.id,
      required this.name,
      required this.userProfile,
      required this.image,
      required this.isSeen});

  static List<ActivitiesModel> items() => [
        ActivitiesModel(
            id: 1,
            name: "You",
            userProfile: R.IMAGES_MODEL_MALE_JPG,
            image: R.IMAGES_MODEL_MALE_JPG,
            isSeen: false),
        ActivitiesModel(
            id: 2,
            name: "Emma",
            userProfile: R.IMAGES_MODEL1_JPG,
            image: R.IMAGES_MODEL1_JPG,
            isSeen: true),
        ActivitiesModel(
            id: 3,
            name: "Ava",
            userProfile: R.IMAGES_MODEL2_JPG,
            image: R.IMAGES_MODEL2_JPG,
            isSeen: false),
        ActivitiesModel(
            id: 4,
            name: "Sophia",
            userProfile: R.IMAGES_MODEL3_JPG,
            image: R.IMAGES_MODEL3_JPG,
            isSeen: true),
        ActivitiesModel(
            id: 5,
            name: "Emelie",
            userProfile: R.IMAGES_MODEL1_JPG,
            image: R.IMAGES_MODEL1_JPG,
            isSeen: false),
        ActivitiesModel(
            id: 6,
            name: "Abigail",
            userProfile: R.IMAGES_MODEL2_JPG,
            image: R.IMAGES_MODEL2_JPG,
            isSeen: true),
      ];
}
