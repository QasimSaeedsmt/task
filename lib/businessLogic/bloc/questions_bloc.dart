import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(QuestionsInitial()) {
    on<ShowSecondQuestion>((event, emit) {

      emit(SecondQuestionShownState());
    });
    on<ShowThirdQuestion>((event, emit) {

      emit(ThirdQuestionShownState());
    });
    on<ShowFourthQuestion>((event, emit) {

      emit(FourthQuestionShownState());
    });



  }
}
