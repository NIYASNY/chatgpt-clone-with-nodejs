import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:client/features/chat/models/chat_message_model.dart';
import 'package:client/repo/repo_chat.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<ChatNewPropmtEvent>(chatNewPropmtEvent);
    on<ChatNewContentGeneratorEvent>(chatNewContentGeneratorEvent);
  }

  StreamSubscription<http.Response>? _subscription;
  List<ChatMessageModel> cachedMessages = [];

  FutureOr<void> chatNewPropmtEvent(
      ChatNewPropmtEvent event, Emitter<ChatState> emit) {
    emit(ChatNewMessageGeneratingLoadingstate());

    try {
      ChatMessageModel newMesaage =
          ChatMessageModel(role: 'user', content: event.prompt);
      cachedMessages.add(newMesaage);
      emit(ChatNewMessageGeneratedState());
      cachedMessages.add(ChatMessageModel(role: 'assistant', content: ""));
      _subscription?.cancel();
      _subscription = getChatGptResponseRepo(cachedMessages).listen((response) {
        log(response.toString());
        for (String line in response.body.split('\n')) {
          String jsonDataString = line.replaceFirst("data: ", "");
          Map<String, dynamic> data = jsonDecode(jsonDataString.trim());
          log(data.toString());
          add(ChatNewContentGeneratorEvent(content: data['data']));
        }
      });
    } catch (e) {
      log(e.toString());
      emit(ChatNewMessageGeneratingErrorstate());
    }
  }

  FutureOr<void> chatNewContentGeneratorEvent(
      ChatNewContentGeneratorEvent event, Emitter<ChatState> emit) {
    ChatMessageModel modelmessage = cachedMessages.last;
    String content = event.content;
    cachedMessages.last = ChatMessageModel(
        role: 'assistant', content: modelmessage.content + content);
    log(cachedMessages.last.content);
    emit(ChatNewMessageGeneratedState());
  }
}
