import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCardResult extends StatelessWidget {
  ReusableCardResult({this.contentChild});

  Widget contentChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: contentChild,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        border: Border.all(
          color: Colors.grey.shade700,
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
