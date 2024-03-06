import 'package:client/features/chat/bloc/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatBloc chatBloc = ChatBloc();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ChatGpt",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            child: Column(
              children: [
                Expanded(child: ListView()),
                Container(
                  height: 120,
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      propmtContainer('Tell me something about hlhlhh'),
                      propmtContainer('Tell me something about hlhlhh'),
                      propmtContainer('Tell me something about hlhlhh'),
                      propmtContainer('Tell me something about hlhlhh'),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6)),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    top: 6,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: controller,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            hintText: 'Ask Anything',
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            fillColor: Colors.transparent,
                            filled: false),
                      )),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                          onTap: () {
                            if (controller.text.isNotEmpty) {
                              chatBloc.add(
                                  ChatNewPropmtEvent(prompt: controller.text));
                            }
                          },
                          child: const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
               const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        "ChatGpt April 2024",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                       SizedBox(
                        width: 12,
                      ),
                      Text('Free Research Preview'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget propmtContainer(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)),
      child: Text(text),
    );
  }
}
