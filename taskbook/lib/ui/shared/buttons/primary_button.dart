import 'package:flutter/material.dart';
import 'package:taskbook/ui/utils/text_style.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final label;

  const PrimaryButton({Key key, this.onPressed, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPrimaryButton(context);
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: 50,
      decoration: new BoxDecoration(
        color: Color(0xff5468ff),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0x305468ff),
            offset: Offset(0, 6),
            blurRadius: 7,
            spreadRadius: 0,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: _buildButtonChild(),
      ),
    );
  }

  Widget _buildButtonChild() {
    return Center(child: Text(label, style: ButtonTextStyle.primary));
  }
}
