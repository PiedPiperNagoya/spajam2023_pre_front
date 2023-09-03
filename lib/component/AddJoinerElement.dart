import 'package:flutter/material.dart';

class AddJoinerElement extends StatefulWidget {
  String name;
  String check;
  AddJoinerElement({
    super.key,
    required this.name,
    required this.check,
  });

  @override
  State<AddJoinerElement> createState() =>
      _AddJoinerElementState(this.name, this.check);
}

class _AddJoinerElementState extends State<AddJoinerElement> {
  String name;
  String check;
  _AddJoinerElementState(this.name, this.check);

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
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
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
