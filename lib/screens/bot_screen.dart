import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class BotScreen extends StatefulWidget {
  const BotScreen({super.key});

  @override
  State<BotScreen> createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "https://www.shutterstock.com/image-vector/chat-bot-icon-virtual-smart-600nw-2478937555.jpg",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat here!"),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [
        chatMessage,
        ...messages
      ]; // Add the sent message to the messages list
    });
    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen(
        (event) {
          // Print the parts data to inspect it
          print("Parts Data: ${event.content?.parts}");

          // Check if we can access part data
          if (event.content?.parts != null) {
            String response = event.content!.parts!.map((part) {
                  // Assuming 'text' is a property in TextPart
                  print("Part: $part");

                  // Extracting text content from TextPart
                  if (part is TextPart) {
                    return part.text ??
                        ""; // Use the correct field if 'text' exists
                  } else {
                    return ""; // Handle other types of parts if necessary
                  }
                }).join(" ") ??
                "";

            // Update the messages based on the response
            ChatMessage message = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: response,
            );

            setState(() {
              messages = [message, ...messages];
            });
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
