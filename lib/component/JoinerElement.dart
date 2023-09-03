import 'package:flutter/material.dart';

class JoinerElement extends StatefulWidget {
  String name;
  JoinerElement({
    super.key,
    required this.name,
  });

  @override
  State<JoinerElement> createState() => _JoinerElementState(
        this.name,
      );
}

class _JoinerElementState extends State<JoinerElement> {
  String name;
  _JoinerElementState(this.name);
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
      ]),
    );
  }
}
