import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
    required this.buttonIcon,
  });

  final String buttonText;
  final Color? buttonColor;
  final Function()? onPressed;
  final Icon buttonIcon;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    final buttonWidth = (screenWidth * 0.35);
    final buttonHeight = (screenHeight * 0.02).clamp(40.0, 70.0);
    final responsiveFontSize = (screenWidth * 0.45).clamp(14.0, 18.0);

    return ElevatedButton.icon(
      icon: buttonIcon,
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          Size(buttonWidth, buttonHeight),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
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
        style: TextStyle(
          fontSize: responsiveFontSize, 
          color: Colors.white,
        ),
      ),
    );
  }
}