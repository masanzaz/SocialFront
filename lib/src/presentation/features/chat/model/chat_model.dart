class ChatModel {
  final String message;
  final String time;
  final bool seen;
  final bool fromOther;

  ChatModel(
      {required this.message,
      required this.time,
      required this.seen,
      required this.fromOther});

  static List<ChatModel> items() => [
        ChatModel(
            message:
                "Hi Jake, how are you? I saw on the app that we’ve crossed paths several times this week.",
            time: "1:00 PM",
            seen: false,
            fromOther: true),
        ChatModel(
            message:
                "Haha truly! Nice to meet you Emelie! What about a cup of coffee today evening?",
            time: "1:01 PM",
            seen: true,
            fromOther: false),
        ChatModel(
            message: "Sure, let’s do it!",
            time: "1:02 PM",
            seen: false,
            fromOther: true),
        ChatModel(
            message:
                "Great I will write later the exact time and place. See you soon!",
            time: "1:05 PM",
            seen: true,
            fromOther: false),
        ChatModel(
            message: "Day well spent! Right?",
            time: "3:00 PM",
            seen: false,
            fromOther: true),
        ChatModel(
            message: "Yes, It was great",
            time: "3:15 PM",
            seen: true,
            fromOther: false),
        ChatModel(
            message: "See you later then!",
            time: "3:20 PM",
            seen: false,
            fromOther: true),
        ChatModel(
            message: "Okay Bye!",
            time: "3:21 PM",
            seen: false,
            fromOther: false)
      ];
}
