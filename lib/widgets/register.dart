import 'package:flutter/material.dart';

class RegisterSheet extends StatefulWidget {
  @override
  _RegisterSheetState createState() => _RegisterSheetState();
}

class _RegisterSheetState extends State<RegisterSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2 * MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }
}
