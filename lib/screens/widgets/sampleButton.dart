import 'package:flutter/material.dart';

class sampleButton extends StatelessWidget {

  final String value;
  final Color? buttonColor;
  final double? buttonHeight;

  const sampleButton({super.key, required this.value, this.buttonColor, this.buttonHeight});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double? height = buttonHeight == null ? 1 : buttonHeight;
    return Container(
      color: buttonColor == null ? Colors.black12 :  buttonColor,
      alignment: Alignment.center,
      width: size.width*0.25,
      padding: EdgeInsets.symmetric(vertical: height == null ? 15.6 : 15.6*height),
      child: Text(value, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
    );
  }
}
