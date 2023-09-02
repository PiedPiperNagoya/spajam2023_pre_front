import 'package:flutter/material.dart';
import 'package:spajam2023_pre_front/component/JoinerElement.dart';
import 'package:spajam2023_pre_front/component/SpotElement.dart';
import 'package:spajam2023_pre_front/component/SubTitleElement.dart';
import 'package:spajam2023_pre_front/pages/SpotList.dart';

/////////////// ホームページ ///////////////
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          // タイトルのコンテナ
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(children: [
              SubTitleElement(title: 'タイトル'),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(children: [
              SubTitleElement(title: '行きたいスポット'),
              SpotList(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: TextButton(
                  onPressed: () {
                    // ボタンが押されたときに発動される処理
                  },
                  child: Text('追加＋',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                ),
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(children: [
              SubTitleElement(title: '参加メンバー'),
              JoinerList(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: TextButton(
                  onPressed: () {
                    // ボタンが押されたときに発動される処理
                  },
                  child: Text('追加＋',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                ),
              )
            ]),
          )
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: DBに反映

          // 最初のスポットを選択する画面へ遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return SpotListPage();
            }),
          );
        },
        icon: new Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          "旅行プランの作成",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 113, 139),
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
