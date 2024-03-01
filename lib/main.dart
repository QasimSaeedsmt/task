import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/screens/questionnaire_screen.dart';

import 'businessLogic/bloc/questions_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Questionnaire App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const QuestionnaireScreen(),
      ),
    );
  }
}

