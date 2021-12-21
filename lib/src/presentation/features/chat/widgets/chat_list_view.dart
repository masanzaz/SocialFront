import 'package:dating/src/presentation/features/chat/model/chat_model.dart';
import 'package:dating/src/presentation/features/chat/widgets/left_chat_view.dart';
import 'package:dating/src/presentation/features/chat/widgets/right_chat_view.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatefulWidget {
  final List<ChatModel> list;

  const ChatListView({required this.list});

  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollToTop();
    });
    super.initState();
  }

  _scrollToTop() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.list.length,
      itemBuilder: (ctx, index) {
        return _itemView(widget.list[index]);
      },
    );
  }

  Widget _itemView(ChatModel chatModel) => chatModel.fromOther
      ? LeftChatView(
          chatModel: chatModel,
        )
      : RightChatView(
          chatModel: chatModel,
        );
}
