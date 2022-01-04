class NewMessageParameter {
  final int matchId;
  final int senderId;
  final String message;

  NewMessageParameter({
    required this.matchId,
    required this.senderId,
    required this.message
  });

  Map<String, dynamic> toJson() => {
    "matchId": matchId,
    "senderId": senderId,
    "content": message
  };
}
