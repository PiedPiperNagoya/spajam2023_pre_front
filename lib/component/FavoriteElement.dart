import 'package:flutter/material.dart';

class FavoriteElement extends StatefulWidget {
  String title;
  FavoriteElement({super.key, required this.title});

  @override
  State<FavoriteElement> createState() => _FavoriteElementState(this.title);
}

class _FavoriteElementState extends State<FavoriteElement> {
  String title;

  _FavoriteElementState(this.title);

  bool _active = false;

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
                '東京タワー',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text('東京タワー方面'),
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
