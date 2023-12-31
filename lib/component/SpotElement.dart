import 'package:flutter/material.dart';

class SpotElement extends StatefulWidget {
  String title;
  String way;
  String wait;
  String move;
  String image;
  SpotElement(
      {super.key,
      required this.title,
      required this.way,
      required this.wait,
      required this.move,
      required this.image});

  @override
  State<SpotElement> createState() =>
      _SpotElementState(this.title, this.way, this.wait, this.move, this.image);
}

class _SpotElementState extends State<SpotElement> {
  String title;
  String way;
  String wait;
  String move;
  String image;

  _SpotElementState(this.title, this.way, this.wait, this.move, this.image);

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
              image,
              // 'https://lh3.googleusercontent.com/ogw/AGvuzYbm8SoY0xm5bSLJDyRIEtYJDMFPjU-tVMsOxDCpmg=s64-c-mo',
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
                  fontSize: 18,
                ),
              ),
              Text(way),
            ],
          ),
        ),
        Spacer(),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('待ち'),
                  Text(
                    wait,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('移動'),
                  Text(
                    move,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
