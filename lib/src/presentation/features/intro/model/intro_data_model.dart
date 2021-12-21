import 'package:dating/src/presentation/components/resources/app_text.dart';
import 'package:dating/src/domain/const/resource.dart';

class IntroDataModel {
  String image;
  String title;
  String subtitle;

  IntroDataModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  static List<IntroDataModel> items() => [
        IntroDataModel(
            image: R.IMAGES_MODEL1_OFFLINE_JPG,
            title: AppText.IntroTitle1,
            subtitle: AppText.IntroSubTitle1),
        IntroDataModel(
            image: R.IMAGES_MODEL2_OFFLINE_JPG,
            title: AppText.IntroTitle2,
            subtitle: AppText.IntroSubTitle2),
        IntroDataModel(
            image: R.IMAGES_MODEL3_OFFLINE_JPG,
            title: AppText.IntroTitle3,
            subtitle: AppText.IntroSubTitle3)
      ];
}
