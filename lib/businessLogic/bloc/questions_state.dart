part of 'questions_bloc.dart';

@immutable
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class SecondQuestionShownState extends QuestionsState{}

class ThirdQuestionShownState extends QuestionsState{}
class FourthQuestionShownState extends QuestionsState{}

