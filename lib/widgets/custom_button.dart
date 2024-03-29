import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.cyan[500], borderRadius: BorderRadius.circular(16)),
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: const Center(
        child: Text(
          "Add",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
