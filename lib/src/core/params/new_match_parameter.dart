class NewMatchParameter {
  final int senderId;
  final int receiverId;

  NewMatchParameter({
    required this.senderId,
    required this.receiverId
  });

  Map<String, dynamic> toJson() => {
    "senderId": senderId,
    "receiverId": receiverId
  };
}
