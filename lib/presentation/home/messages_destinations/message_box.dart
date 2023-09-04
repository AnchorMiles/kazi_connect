import 'package:flutter/material.dart';

class MessageBoxPage extends StatefulWidget {
  const MessageBoxPage({super.key});

  @override
  State<MessageBoxPage> createState() => _MessageBoxPageState();
}

class _MessageBoxPageState extends State<MessageBoxPage> {
  // TODO: Initialize Firebase instance and reference here

  TextEditingController _messageController = TextEditingController();
  List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    // TODO: Initialize Firebase reference for reading messages and listen for updates
  }

  // Function to send a message to Firebase
  void _sendMessage(String messageText) {
    // TODO: Send message to Firebase here
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sender Name'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message['text']),
                  subtitle: Text(message['sender']),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final messageText = _messageController.text;
                    if (messageText.isNotEmpty) {
                      _sendMessage(messageText);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
