import 'package:flutter/material.dart';

class ReButton extends StatelessWidget {
  final Function()? onPressed;
  const ReButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        ),
      ),
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }
}
