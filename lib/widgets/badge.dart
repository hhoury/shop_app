// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, prefer_if_null_operators, unnecessary_null_comparison

import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    //  Key key,
   required this.child,
    required this.value,
    required this.color,
  });// : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color != null ? color : Theme.of(context).accentColor,
            ),
            // ignore: prefer_const_constructors
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
