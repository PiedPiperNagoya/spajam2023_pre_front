import 'package:flutter/material.dart';
import 'package:spajam2023_pre_front/component/JoinerElement.dart';
import 'package:spajam2023_pre_front/component/SpotElement.dart';
import 'package:spajam2023_pre_front/component/SubTitleElement.dart';
import 'package:spajam2023_pre_front/pages/SpotList.dart';
import 'package:spajam2023_pre_front/component/FavoriteElement.dart';

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
              Stack(children: [
                SubTitleElement(title: '行きたいスポット'),
                TextButton(
                  onPressed: () {
                    // ボタンが押されたときに発動される処理
                    showModalBottomSheet(
                      //モーダルの背景の色、透過
                      // backgroundColor: Colors,
                      //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return FavoriteModal();
                      },
                    );
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
              ]),
              SpotList(),
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(children: [
              Stack(children: [
                SubTitleElement(title: '参加メンバー'),
                TextButton(
                  onPressed: () {
                    // ボタンが押されたときに発動される処理
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return AddJoinersModal();
                      },
                    );
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
              ]),
              JoinerList(),
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

class FavoriteModal extends StatefulWidget {
  const FavoriteModal({super.key});

  @override
  State<FavoriteModal> createState() => _FavoriteModalState();
}

class _FavoriteModalState extends State<FavoriteModal> {
  //画面に描画するデータリスト作成
  @override
  Widget build(BuildContext context) {
    final List<Widget> _SpotHistoryListWidgets = <Widget>[];
    for (String num in ["1", "2", "2", "2", "2"]) {
      _SpotHistoryListWidgets.add(Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: FavoriteElement(
          title: num,
        ),
      ));
    }
    return Container(
        margin: EdgeInsets.only(top: 64),
        decoration: BoxDecoration(
          //モーダル自体の色
          color: Colors.white,
          //角丸にする
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              SubTitleElement(title: 'お気に入りの検索'),
              // TextField(),
              Expanded(
                  child: SizedBox(
                height: 500,
                child: ListView(
                  children: _SpotHistoryListWidgets,
                ),
              )),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                  label: Text('決定'),
                ),
              )
            ],
          ),
        ));
  }
}

class AddJoinersModal extends StatefulWidget {
  const AddJoinersModal({super.key});

  @override
  State<AddJoinersModal> createState() => _AddJoinersModalState();
}

class _AddJoinersModalState extends State<AddJoinersModal> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _AddJoinersModalWidgets = <Widget>[];
    for (String num in ["1", "2", "2", "2", "2"]) {
      _AddJoinersModalWidgets.add(Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: FavoriteElement(
          title: num,
        ),
      ));
    }
    return Container(
        child: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          SubTitleElement(title: '参加メンバー'),
          // TextField(),
          Expanded(
              child: SizedBox(
            height: 500,
            child: ListView(
              children: _AddJoinersModalWidgets,
            ),
          )),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close),
              label: Text('決定'),
            ),
          )
        ],
      ),
    ));
  }
}
