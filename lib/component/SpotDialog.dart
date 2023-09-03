import 'package:flutter/material.dart';

class SubTitleElement extends StatefulWidget {
  String title;
  String address;
  String wait;

  SubTitleElement(
      {super.key,
      required this.title,
      required this.address,
      required this.wait});

  @override
  State<SubTitleElement> createState() =>
      _SubTitleElementState(this.title, this.address, this.wait);
}

class _SubTitleElementState extends State<SubTitleElement> {
  String title;
  String address;
  String wait;

  _SubTitleElementState(this.title, this.address, this.wait);

  @override
  Widget build(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              AlertDialog(
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Stack(children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Image.network(
                          'https://lh3.googleusercontent.com/ogw/AGvuzYbm8SoY0xm5bSLJDyRIEtYJDMFPjU-tVMsOxDCpmg=s64-c-mo',
                          fit: BoxFit.contain,
                        ),
                      ]),
                      Text(
                        '所在地',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        address,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '平均待ち時間',
                        style: TextStyle(
                          color: Color(0x888888ff),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        wait,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  // ボタン
                ],
              ),
            ],
          );
        });
  }
}
