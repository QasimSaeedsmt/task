import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/widgets/custom_text_field.dart';

import '../../businessLogic/bloc/questions_bloc.dart';
import '../../services/mock_api.dart'; // Import the mock API service

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final _formKey = GlobalKey<FormState>();
  int? _selectedValue;
  String favouriteColor = "Red";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Questionnaire"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<QuestionsBloc, QuestionsState>(
          builder: (context, state) {
            int selectedQuestion = 1;
            if (state is SecondQuestionShownState) {
              selectedQuestion = 2;
            }
            if (state is ThirdQuestionShownState) {
              selectedQuestion = 3;
            }
            if (state is FourthQuestionShownState) {
              selectedQuestion = 4;
            }
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Show custom field or radio buttons based on the current question
                    selectedQuestion == 1
                        ? const CustomFieldWidgetWIthTitle(
                      title: "What is your name?",
                      validValue: "John",
                    )
                        : selectedQuestion == 2
                        ? buildRadioButtonsWidget(
                        "What is your favourite Color?",
                        "Blue",
                        "Red",
                        "Green")
                        : selectedQuestion == 3
                        ? const CustomFieldWidgetWIthTitle(
                        title:
                        "How many Programming Languages do you know?",
                        validValue: "5")
                        : selectedQuestion == 4
                        ? buildRadioButtonsWidget(
                        "Which of the following frameworks have you worked with",
                        "Flutter",
                        "React Native",
                        "Angular",
                        fourthOption: "Vue.js")
                        : const SizedBox.shrink(),
                    // Submit button
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                                foregroundColor:
                                MaterialStatePropertyAll<Color>(Colors.white)),
                            onPressed: () async {
                              final bloc = context.read<QuestionsBloc>();
                              // Validate and move to the next question
                              // or submit answers based on the current question
                              if (selectedQuestion == 1) {
                                if (_formKey.currentState?.validate() ?? false) {
                                  if (kDebugMode) {
                                    print("John");
                                  }
                                  bloc.add(ShowSecondQuestion());
                                }
                              }
                              if (selectedQuestion == 2) {
                                if (_selectedValue == 2) {
                                  if (kDebugMode) {
                                    print("Red");
                                  }
                                  bloc.add(ShowThirdQuestion());
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Wrong Answer")));
                                }
                              }
                              if (selectedQuestion == 3) {
                                if (_formKey.currentState?.validate() ?? false) {
                                  if (kDebugMode) {
                                    print("5");
                                  }
                                  bloc.add(ShowFourthQuestion());
                                }
                              }
                              if (selectedQuestion == 4) {
                                if (_selectedValue == 1) {
                                  if (kDebugMode) {
                                    print("Flutter");
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Successfully Completed")));
                                  await MockApiService.submitAnswers(
                                    name: "John",
                                    favoriteColor: "Red",
                                    programmingLanguagesKnown: 5,
                                    frameworkWorkedWith: "Flutter",
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Wrong Answer")));
                                }
                              }
                            },
                            child:  Text(selectedQuestion==4?"Submit": "Next"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Widget to build radio buttons based on the provided options
  Column buildRadioButtonsWidget(
      String title, String firstOption, String secondOption, String thirdOption,
      {String? fourthOption}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Radio<int>(
          value: 1,
          groupValue: _selectedValue,
          onChanged: (int? value) {
            setState(() {
              _selectedValue = value;
            });
          },
        ),
        Text(firstOption),
        Radio<int>(
          value: 2,
          groupValue: _selectedValue,
          onChanged: (int? value) {
            setState(() {
              _selectedValue = value;
            });
          },
        ),
        Text(secondOption),
        Radio<int>(
          value: 3,
          groupValue: _selectedValue,
          onChanged: (int? value) {
            setState(() {
              _selectedValue = value;
            });
          },
        ),
        Text(thirdOption),
        // Add fourth option radio button if provided
        fourthOption != null && fourthOption.isNotEmpty
            ? Radio<int>(
          value: 3,
          groupValue: _selectedValue,
          onChanged: (int? value) {
            setState(() {
              _selectedValue = value;
            });
          },
        )
            : const SizedBox.shrink(),
        Text(fourthOption ?? "")
      ],
    );
  }
}
