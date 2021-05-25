import 'package:flutter/material.dart';

class Displayer extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  Displayer({@required this.primaryText, @required this.secondaryText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 75,
              child: SingleChildScrollView(
                reverse: true,
                child: Text(
                  primaryText,
                  maxLines: 1000,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 8,
            ),
          ),
          Text(
            secondaryText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
