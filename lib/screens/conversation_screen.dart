import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  static const routeName = '/conversation';

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final List<Map<String, String>> conversation = [
    {'sender': 'John Doe', 'message': 'I would like to request the apples.'},
    {'sender': 'You', 'message': 'Sure, they are available for pickup.'},
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      setState(() {
        conversation.add({'sender': 'You', 'message': text});
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> message = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Conversation with ${message['name']}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: conversation.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(
                    conversation[index]['sender']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(conversation[index]['message']!),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Send a message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
