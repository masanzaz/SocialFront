import 'package:dating/src/domain/const/resource.dart';
import 'package:dating/src/presentation/features/message/model/activities_model.dart';

class MessageModel {
  final int id;
  final String userProfile;
  final bool hasStory;
  final String name;
  final String recentMessage;
  final String time;
  final String unreadCount;
  final ActivitiesModel? activitiesModel;

  MessageModel(
      {required this.id,
      required this.userProfile,
      required this.hasStory,
      required this.name,
      required this.recentMessage,
      required this.time,
      required this.unreadCount,
      this.activitiesModel});

  static List<MessageModel> items() => [
        MessageModel(
            id: 11,
            name: "Emma",
            userProfile: R.IMAGES_MODEL1_JPG,
            hasStory: true,
            recentMessage: "Ok, see you then",
            time: "20 min",
            unreadCount: "2",
            activitiesModel: ActivitiesModel(
                id: 11,
                name: "Emma",
                userProfile: R.IMAGES_MODEL1_JPG,
                image: R.IMAGES_MODEL1_JPG,
                isSeen: false)),
        MessageModel(
            id: 21,
            name: "Ava",
            userProfile: R.IMAGES_MODEL2_JPG,
            hasStory: false,
            recentMessage: "Your favourite movie?",
            time: "30 min",
            unreadCount: "5"),
        MessageModel(
            id: 31,
            name: "Sophia",
            userProfile: R.IMAGES_MODEL3_JPG,
            hasStory: true,
            recentMessage: "Bye!",
            time: "1 hr",
            unreadCount: "0",
            activitiesModel: ActivitiesModel(
                id: 31,
                name: "Sophia",
                userProfile: R.IMAGES_MODEL3_JPG,
                image: R.IMAGES_MODEL3_JPG,
                isSeen: false)),
        MessageModel(
            id: 41,
            name: "Emelie",
            userProfile: R.IMAGES_MODEL1_JPG,
            hasStory: false,
            recentMessage: "Great, that would be awesome!",
            time: "2 hr",
            unreadCount: "0"),
        MessageModel(
            id: 51,
            name: "Abigail",
            userProfile: R.IMAGES_MODEL2_JPG,
            hasStory: false,
            recentMessage: "See you later!",
            time: "3 hr",
            unreadCount: "0"),
        MessageModel(
            id: 61,
            name: "John",
            userProfile: R.IMAGES_MODEL_MALE_JPG,
            hasStory: false,
            recentMessage: "I wish, I could",
            time: "6 hr",
            unreadCount: "0")
      ];
}
