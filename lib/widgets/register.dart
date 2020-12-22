import 'package:flutter/material.dart';
import 'package:internship/size_config.dart';

class RegisterModal extends StatefulWidget {
  double _registerYOffset;
  Function changePage;
  RegisterModal(this._registerYOffset, this.changePage);
  @override
  _RegisterModalState createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: SizeConfig.heightMultiplier * 66,
      padding: EdgeInsets.symmetric(
          horizontal: 3 * SizeConfig.heightMultiplier,
          vertical: 7 * SizeConfig.widthMultiplier),
      curve: Curves.linear,
      duration: Duration(milliseconds: 1000),
      transform: Matrix4.translationValues(0, widget._registerYOffset, 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.2 * SizeConfig.widthMultiplier),
            topRight: Radius.circular(5.2 * SizeConfig.widthMultiplier)),
      ),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              widget.changePage(1);
            },
            child: Text('BACK')),
      ),
    );
  }
}
