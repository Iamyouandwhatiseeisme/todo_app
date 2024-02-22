import 'package:flutter/material.dart';

class TaskTexField extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  const TaskTexField({
    super.key,
    required this.hintText,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          minLines: 1,
          controller: textController,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              contentPadding: const EdgeInsets.only(left: 10),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle()),
        ));
  }
}
