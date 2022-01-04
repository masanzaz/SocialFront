import 'package:dating/src/core/utils/resources/resource.dart';
import 'package:dating/src/presentation/features/matches/model/matches_model.dart';
import 'package:dating/src/presentation/features/message/model/activities_model.dart';

class MessageModel {
  final int id;
  final String userProfile;
  final bool hasStory;
  final String name;
  final String recentMessage;
  final String time;
  final int unreadCount;
  final MatchesModel? activitiesModel;

  MessageModel(
      {required this.id,
      required this.userProfile,
      required this.hasStory,
      required this.name,
      required this.recentMessage,
      required this.time,
      required this.unreadCount,
      this.activitiesModel});

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      id: json["id"],
      name: json["firstName"],
      //userProfile: json["image"],
      userProfile: R.IMAGES_MODEL1_JPG,
      hasStory: false,
      recentMessage: json["content"],
      time: json["time"],
      unreadCount: json["unreadCount"]
  );

 /* static List<MessageModel> items() => [
        MessageModel(
            id: 11,
            name: "Emma",
            userProfile: R.IMAGES_MODEL1_JPG,
            hasStory: true,
            recentMessage: "Ok, see you then",
            time: "20 min",
            unreadCount: "2",
),
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
),
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
      ];*/
}
