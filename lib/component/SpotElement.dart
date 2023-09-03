import 'package:flutter/material.dart';

class SpotElement extends StatefulWidget {
  const SpotElement({super.key});

  @override
  State<SpotElement> createState() => _SpotElementState();
}

class _SpotElementState extends State<SpotElement> {
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
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('待ち'),
                  Text(
                    '25分',
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
                    '25分',
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
