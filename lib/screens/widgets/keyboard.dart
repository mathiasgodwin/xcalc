import 'package:flutter/material.dart';
import 'package:xcalc/constants.dart';
import 'package:xcalc/screens/widgets/keyboard_button.dart';

class Keyboard extends StatelessWidget {
  final Function passToButton;
  Keyboard(this.passToButton);

  Widget rowButton(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons
            .map((id) =>
                KeyboardButton(id: id, onPressed: () => passToButton(id)))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFF292D36),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Column(
        children: <Widget>[
          rowButton([
            ButtonId.ac,
            ButtonId.openParantes,
            ButtonId.closeParantes,
            ButtonId.division,
          ]),
          rowButton([
            ButtonId.one,
            ButtonId.two,
            ButtonId.three,
            ButtonId.multiplication,
          ]),
          rowButton([
            ButtonId.four,
            ButtonId.five,
            ButtonId.six,
            ButtonId.minus,
          ]),
          rowButton(
              [ButtonId.seven, ButtonId.eight, ButtonId.nine, ButtonId.plus]),
          rowButton([
            ButtonId.point,
            ButtonId.zero,
            ButtonId.backspace,
            ButtonId.equal,
          ]),
        ],
      ),
    );
  }
}
