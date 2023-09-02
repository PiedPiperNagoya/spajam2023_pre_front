import 'package:flutter/material.dart';

class SubTitleElement extends StatefulWidget {
  String title;

  SubTitleElement({super.key, required this.title});

  @override
  State<SubTitleElement> createState() => _SubTitleElementState(this.title);
}

class _SubTitleElementState extends State<SubTitleElement> {
  String title;

  _SubTitleElementState(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(
          this.title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      )
    ]));
  }
}
