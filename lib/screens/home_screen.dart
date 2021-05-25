import 'package:flutter/material.dart';
import 'package:xcalc/calc_logic.dart';
import 'package:xcalc/screens/widgets/displayer.dart';
import 'package:xcalc/screens/widgets/keyboard.dart';
import 'package:xcalc/utils/utils.dart';
import 'package:xcalc/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _questionDisplayText = '';
  String _answerDisplayText = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // void _openEndDrawer() {
  //   _scaffoldKey.currentState!.openEndDrawer();
  // }

  // void _closeEndDrawer() {
  //   Navigator.of(context).pop();
  // }

  void buttonPress(String id) {
    setState(() {
      if (id == ButtonId.ac) {
        _questionDisplayText = '';
        _answerDisplayText = '';
      } else if (id == ButtonId.equal) {
        double result = calculate(_questionDisplayText);
        if (result != double.infinity) {
          _answerDisplayText = _questionDisplayText;
          _questionDisplayText = cleanResult(result);
        } else {
          _answerDisplayText = 'Bad expression';
        }
      } else if (id == ButtonId.backspace) {
        _questionDisplayText =
            _questionDisplayText.replaceAll(RegExp(r'.$'), '');
        double result = calculate(_questionDisplayText);
        if (result != double.infinity) _answerDisplayText = cleanResult(result);
      } else {
        _questionDisplayText += id;
        double result = calculate(_questionDisplayText);
        if (result != double.infinity) _answerDisplayText = cleanResult(result);
      }
    });
  }

  /// Navigation drawer for the app.

  final _drawer = Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -2.5,
                ),
                children: [
                  const TextSpan(
                    text: 'X',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const TextSpan(text: ' Calc')
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
        ListTile(
            title: Text('About'),
            leading: Icon(Icons.help_outline_rounded),
            onTap: () => {} //launch('https://github.com/mathiasgodwin/xcalc'),
            ),
        SizedBox(
          height: 25,
        ),
        ListTile(
          title: Text('Rate'),
          leading: Icon(Icons.rate_review_rounded),
          onTap: () => {},
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _drawer,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.white10,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -2.5,
                ),
                children: [
                  const TextSpan(
                    text: 'X',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const TextSpan(
                      text: ' Calc', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Displayer(
                primaryText: _questionDisplayText,
                secondaryText: _answerDisplayText,
              ),
            ),
            Expanded(
              flex: 2,
              child: Keyboard(buttonPress),
            )
          ],
        ),
      ),
    );
  }
}
