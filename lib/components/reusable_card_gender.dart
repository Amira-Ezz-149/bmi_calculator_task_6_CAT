import 'package:flutter/material.dart';

class ReusableCardGender extends StatefulWidget {
  ReusableCardGender({this.cardChild, this.onPress, this.color});

  final Widget cardChild;
  final Function onPress;
  // Color selectedBorderColor ;
  // Color selectedCheckColor ;
  Color color;

  @override
  _ReusableCardGenderState createState() => _ReusableCardGenderState();
}

class _ReusableCardGenderState extends State<ReusableCardGender> {
  ///Color defaultBorderColor = Color(0xff232333);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onPress,
          child: Container(
            child: widget.cardChild,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: widget.color, width: 3)),
          ),
        ),
        Positioned(
          child: Icon(
            Icons.check_circle,
            size: 18,
            color: widget.color,
          ),
          right: 10,
          top: 10,
        ),
      ],
    );
  }
}
