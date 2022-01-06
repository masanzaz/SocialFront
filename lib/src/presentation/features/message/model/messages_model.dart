import 'package:dating/src/core/utils/resources/constants.dart';
import 'package:dating/src/presentation/features/matches/model/matches_model.dart';

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
      userProfile: ServerUrl + (json['image'] ?? ""),
      hasStory: false,
      recentMessage: json["content"],
      time: json["time"],
      unreadCount: json["unreadCount"]
  );
}
