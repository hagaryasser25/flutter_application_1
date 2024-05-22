import 'package:flutter/material.dart';

class DarkButton extends StatelessWidget {
  Function() onPress;
  String txt;
  double buttonWidth, buttonHeight;

  DarkButton({
    super.key,
    required this.txt,
    required this.onPress,
    required this.buttonWidth,
    required this.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    /*
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            backgroundColor:
                WidgetStateProperty.all<Color>(MainRed),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color:MainRed),
            ))),
        onPressed: onPress,
        child: Text(
          txt,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Almarai-Regular',
            fontWeight: FontWeight.w700,
            height: 1.71,
            letterSpacing: 0.50,
          ),
        ),
      ),
    );
    */
  }
}
