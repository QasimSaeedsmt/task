part of 'questions_bloc.dart';

@immutable
abstract class QuestionsEvent {}

class ShowSecondQuestion extends QuestionsEvent{}

class ShowThirdQuestion extends QuestionsEvent{}
class ShowFourthQuestion extends QuestionsEvent{}
