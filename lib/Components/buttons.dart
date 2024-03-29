import 'package:flutter/material.dart';


class Buttons extends StatelessWidget {
  String buttonType;
  final VoidCallback onPressed;
  Color color;
   Buttons({
  required this.buttonType,
  required this.onPressed,
  required this.color,
  }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: color,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: onPressed,
                  // onPressed: () {
                  //   //Go to login screen.
                  //   Navigator.pushNamed(context, route);
                  // },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      buttonType,style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
  }
}