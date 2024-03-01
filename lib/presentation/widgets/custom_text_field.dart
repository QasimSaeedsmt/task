import 'package:flutter/material.dart';

class CustomFieldWidgetWIthTitle extends StatelessWidget {
  final String title;
  final String validValue;
  const CustomFieldWidgetWIthTitle({
    required this.title,
    required this.validValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
            validator: (value) {
              if (value == validValue) {
                return null;
              } else {
                return "Wrong Answer";
              }
            },
          ),
        ],
      ),
    );
  }
}
