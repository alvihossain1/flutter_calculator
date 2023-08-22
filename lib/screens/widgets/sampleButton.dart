import 'package:flutter/material.dart';

class sampleButton extends StatefulWidget {

  final String value;
  final Color? buttonColor;
  final double? buttonHeight;

  const sampleButton({super.key, required this.value, this.buttonColor, this.buttonHeight});

  @override
  State<sampleButton> createState() => _sampleButtonState();
}

class _sampleButtonState extends State<sampleButton> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double? height = widget.buttonHeight == null ? 1 : widget.buttonHeight;
    return Container(
      color: widget.buttonColor == null ? Colors.black12 :  widget.buttonColor,
      alignment: Alignment.center,
      width: size.width*0.25,
      // height: size.height*0.08,
      padding: EdgeInsets.symmetric(vertical: height == null ? 15.6 : 15.6*height),
      child: Text(widget.value, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
    );
  }
}
