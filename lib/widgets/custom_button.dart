import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.cyan[500], borderRadius: BorderRadius.circular(16)),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 31, 31, 31),
                  ),
                )
              : const Text(
                  "Add",
                  style: TextStyle(color: Colors.black),
                ),
        ),
      ),
    );
  }
}
