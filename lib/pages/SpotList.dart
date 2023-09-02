import 'package:flutter/material.dart';
import 'package:spajam2023_pre_front/component/JoinerElement.dart';
import 'package:spajam2023_pre_front/component/SpotElement.dart';
import 'package:spajam2023_pre_front/component/SubTitleElement.dart';

/////////////// ホームページ ///////////////
class SpotListPage extends StatefulWidget {
  const SpotListPage({Key? key}) : super(key: key);

  @override
  State<SpotListPage> createState() => _SpotListPageState();
}

class _SpotListPageState extends State<SpotListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // タイトルテキスト
        title: Text(
          'Wanderist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(children: [
              Stack(children: [
                _addButton(),
                SubTitleElement(title: '行きたいスポット'),
              ]),
              SpotList(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(children: [
              SubTitleElement(title: 'オススメスポット'),
              JoinerList(),
            ]),
          )
        ]),
      ),
    );
  }
}

class SpotList extends StatefulWidget {
  const SpotList({super.key});

  @override
  State<SpotList> createState() => _SpotListState();
}

class _SpotListState extends State<SpotList> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _SpotListWidgets = <Widget>[];
    for (String num in ["1", "2"]) {
      _SpotListWidgets.add(Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: SpotElement(),
      ));
    }
    return SizedBox(
      height: 220,
      child: ListView(
        children: _SpotListWidgets,
      ),
    );
  }
}

class JoinerList extends StatefulWidget {
  const JoinerList({super.key});

  @override
  State<JoinerList> createState() => _JoinerListState();
}

class _JoinerListState extends State<JoinerList> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _JoinerListWidgets = <Widget>[];
    for (String num in ["1", "2"]) {
      _JoinerListWidgets.add(Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: JoinerElement(),
      ));
    }
    return SizedBox(
      height: 150,
      child: ListView(
        children: _JoinerListWidgets,
      ),
    );
  }
}

Widget _addButton() {
  return Container(
      child: Column(children: [
    Container(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          // ボタンが押されたときに発動される処理
        },
        child: Container(
          width: double.infinity,
          child: Text('追加＋',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 19,
              )),
        ),
      ),
    )
  ]));
}
