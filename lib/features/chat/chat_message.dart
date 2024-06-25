class ChatMessage {
  final String user;
  final String message;

  ChatMessage({required this.user, required this.message});

  get length => null;
}

List<ChatMessage> mockMessages = [
  ChatMessage(user: "Alice", message: "Hallo, wie geht's?"),
  ChatMessage(user: "Bob", message: "Mir geht's gut, und dir?"),
  ChatMessage(user: "Alice", message: "Auch gut, danke!"),
  ChatMessage(user: "Bob", message: "Schön, das zu hören!"),
  ChatMessage(user: "Alice", message: "Ja, nicht wahr?"),
  ChatMessage(user: "Bob", message: "Ja, das ist es!"),
];
