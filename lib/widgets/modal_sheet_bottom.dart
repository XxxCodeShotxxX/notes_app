import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_textfield.dart';

import 'custom_button.dart';

class AddModalBottomSheet extends StatelessWidget {
  const AddModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: "Title",
            ),
            CustomTextField(
              hintText: "Comment",
              maxLines: 5,
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
