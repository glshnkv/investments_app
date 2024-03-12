import 'package:flutter/material.dart';
import 'package:investments_app/theme/colors.dart';

class TextFieldAppWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;

  const TextFieldAppWidget({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  State<TextFieldAppWidget> createState() => _TextFieldAppWidgetState();
}

class _TextFieldAppWidgetState extends State<TextFieldAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.white50,
            ),
          ),
        ),
        SizedBox(height: 5),
        TextField(
          style: TextStyle(color: Colors.white),
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.darkPink,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.pink),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
      ],
    );
  }
}
