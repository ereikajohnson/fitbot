import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool isloading = false;
  bool cansent = false;

  final String apiKey = 'AIzaSyB4MUupbmSLJ43063kJni7XYXePe9tjoD4';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        cansent = _controller.text.trim().isNotEmpty;
      });
    });
  }

  Future<void> sendMessage(String userMessage) async {
    setState(() {
      _messages.add({'role': 'user', 'text': userMessage});
      isloading = true;
      cansent = false;
    });

    final uri = Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey');

    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      'contents': [
        {
          'parts': [
            {'text': userMessage}
          ]
        }
      ]
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final botReply = data['candidates'][0]['content']['parts'][0]['text'];

        setState(() {
          _messages.add({'role': 'bot', 'text': botReply});
        });
      } else {
        setState(() {
          _messages.add({
            'role': 'bot',
            'text': 'Something went wrong. Please try again later.'
          });
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({'role': 'bot', 'text': 'Error: $e'});
      });
    } finally {
      setState(() {
        isloading = false;
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Chat Assistant"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 230, 99, 99),
                Color.fromARGB(255, 54, 123, 179),
              ],
            ),
          ),
        ),
        centerTitle: true,
        elevation: 3,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 230, 99, 99),
              Color.fromARGB(255, 54, 123, 179),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: _messages.length,
                itemBuilder: (context, index) =>
                    _buildMessage(_messages.reversed.toList()[index]),
              ),
            ),
            if (isloading)
              const Padding(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(
                  color: Color(0xFF34C759),
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type your question...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    mini: true,
                    onPressed: (cansent && !isloading)
                        ? () => sendMessage(_controller.text.trim())
                        : null,
                    backgroundColor:
                        (cansent && !isloading) ? const Color.fromARGB(255, 48, 93, 113) : Colors.grey,
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Map<String, String> message) {
    bool isUser = message['role'] == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(14),
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? const Color.fromARGB(255, 48, 93, 113) : Colors.grey[200],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          message['text'] ?? '',
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}