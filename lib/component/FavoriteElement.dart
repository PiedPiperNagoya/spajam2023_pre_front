import 'package:flutter/material.dart';

class FavoriteElement extends StatefulWidget {
  String title;
  String way;
  String wait;
  String move;
  String check;
  String image;
  FavoriteElement(
      {super.key,
      required this.title,
      required this.way,
      required this.wait,
      required this.move,
      required this.check,
      required this.image});

  @override
  State<FavoriteElement> createState() => _FavoriteElementState(
      this.title, this.way, this.wait, this.move, this.check, this.image);
}

class _FavoriteElementState extends State<FavoriteElement> {
  String title;
  String way;
  String wait;
  String move;
  String check;
  String image;

  _FavoriteElementState(
      this.title, this.way, this.wait, this.move, this.check, this.image);

  late bool _active = (check == "true") ? true : false;

  void _changeSwitch(bool e) => setState(() => _active = e);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          width: 55,
          height: 55,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9.0),
            child: Image.network(
              'https://lh3.googleusercontent.com/ogw/AGvuzYbm8SoY0xm5bSLJDyRIEtYJDMFPjU-tVMsOxDCpmg=s64-c-mo',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(way),
            ],
          ),
        ),
        Spacer(),
        Switch(
          value: _active,
          // activeColor: Colors.blueAccent,
          // activeTrackColor: Colors.blue,
          // inactiveThumbColor: Colors.white,
          // inactiveTrackColor: Colors.black38,
          onChanged: _changeSwitch,
        )
      ]),
    );
  }
}
