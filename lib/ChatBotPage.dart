import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'openai_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];
  bool isLoading = false;
  late OpenAIService _openAIService;

  @override
  void initState() {
    super.initState();
    _openAIService = OpenAIService('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');
  }

  void _handleSubmitted(String text) async {
    if(text == ""){
      return;
    }
    _textController.clear();
    setState(() {
      _messages.insert(0, text);
    });
    isLoading = true;

    final response = await _openAIService.getResponse(text);
    setState(() {
      isLoading = false;
      _messages.insert(0, response);

    });

  }

  Widget _buildTextComposer() {
    return Container(
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10),
       color: Colors.white12,
     ),

      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                style: TextStyle(color:Colors.white70),
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(hintText: 'Send a message.....',hintStyle:TextStyle(color: Colors.white54,fontStyle: FontStyle.italic) ),
              ),
            ),
            Visibility(
              visible: !isLoading,
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      itemCount: _messages.length,
      reverse: true,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(

          leading: const CircleAvatar(
            backgroundColor: Color(0xff344654),
            child: Icon(Icons.account_circle_sharp),
          ),
          title: Text(_messages[index],style: const TextStyle(color: Colors.white70,fontStyle: FontStyle.italic),),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('@Kumar_11jr'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: const Color(0xff343541),
        child: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: _buildMessageList(),
              ),
              Visibility(
                visible: isLoading,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(height: 1.0 , color: Colors.amber),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xff343541)),
                  child: _buildTextComposer(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}