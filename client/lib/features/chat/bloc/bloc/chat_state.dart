part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

final class ChatInitial extends ChatState {}

class ChatNewMessageGeneratingLoadingstate extends ChatState {}

class ChatNewMessageGeneratingErrorstate extends ChatState {}

class ChatNewMessageGeneratedState extends ChatState {}


