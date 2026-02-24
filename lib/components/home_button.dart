import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';

class HomeButton extends StatelessWidget {
  const HomeButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.onPressed,
      required this.buttonIcon});

  final String buttonText;
  final Color? buttonColor;
  final Function()? onPressed;
  final Icon buttonIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: buttonIcon,
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          const Size(120, 30),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(60.0),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return buttonColor?.withOpacity(0.5) ??
                colorScheme.secondary.withOpacity(0.5);
          }
          return buttonColor ?? colorScheme.secondary;
        }),
      ),
      label: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
