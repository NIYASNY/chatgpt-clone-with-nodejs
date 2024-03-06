part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class ChatNewPropmtEvent extends ChatEvent {
  final String prompt;

  ChatNewPropmtEvent({required this.prompt});
}

class ChatNewContentGeneratorEvent extends ChatEvent {
  final String content;
  ChatNewContentGeneratorEvent({required this.content});
}
