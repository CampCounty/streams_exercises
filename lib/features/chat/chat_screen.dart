import 'package:flutter/material.dart';
import 'package:streams_exercises/features/chat/chat_repository.dart';
import 'package:streams_exercises/features/chat/chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.chatRepository,
  });

  final ChatRepository chatRepository;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<ChatMessage>(
              stream: widget.chatRepository.messages,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    _messages.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error occurred'));
                } else if (snapshot.hasData) {
                  _messages.add(snapshot.data!);
                }

                return ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return ListTile(
                      title: Text(message.user),
                      subtitle: Text(message.message),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: widget.chatRepository.startSendingMessages,
              child: const Text('Start Chat'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.chatRepository.dispose();
    super.dispose();
  }
}
