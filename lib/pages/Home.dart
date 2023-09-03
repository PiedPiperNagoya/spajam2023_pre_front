import 'package:flutter/material.dart';
import 'package:spajam2023_pre_front/component/JoinerElement.dart';
import 'package:spajam2023_pre_front/component/SpotElement.dart';
import 'package:spajam2023_pre_front/component/SubTitleElement.dart';
import 'package:spajam2023_pre_front/pages/SpotList.dart';
import 'package:spajam2023_pre_front/component/FavoriteElement.dart';
import 'package:spajam2023_pre_front/component/AddJoinerElement.dart';

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
                  onPressed: () async {
                    // ボタンが押されたときに発動される処理
                    var result = await showModalBottomSheet(
                      //モーダルの背景の色、透過
                      // backgroundColor: Colors,
                      //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return FavoriteModal();
                      },
                    );
                    print(result);
                  },
                  child: Container(
                    width: double.infinity,
                    child: Text('追加＋',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(94, 92, 222, 1),
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
                          color: Color.fromRGBO(94, 92, 222, 1),
                        )),
                  ),
                ),
              ]),
              JoinerList(),
            ]),
          ),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('旅行プランの作成'),
                onPressed: () {
                  // TODO: DBに反映

                  // 最初のスポットを選択する画面へ遷移
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return SpotListPage();
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(94, 92, 222, 1), // background
                    onPrimary: Colors.white, // foreground
                    fixedSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5) //こちらを適用
                        )),
              )),
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
  var favorite_list = [
    {
      "spot": "東京タワー",
      "way": "東京タワー方面",
      "wait": "25",
      "move": "25",
    },
    {
      "spot": "歌舞伎座",
      "way": "新宿方面",
      "wait": "10",
      "move": "10",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> _SpotListWidgets = <Widget>[];
    for (var info in favorite_list) {
      _SpotListWidgets.add(Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: SpotElement(
          title: info["spot"] ?? "",
          way: info["way"] ?? "",
          wait: info["wait"] ?? "",
          move: info["move"] ?? "",
        ),
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
  var joiner_list = [
    {"name": "たつや", "check": "true"},
    {"name": "りしゅん", "check": "true"},
  ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> _JoinerListWidgets = <Widget>[];
    for (var info in joiner_list) {
      _JoinerListWidgets.add(Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: JoinerElement(
          name: info["name"] ?? "",
        ),
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
  var favorite_list = [
    {
      "spot": "月島もんじゃストリート",
      "way": "東京都中央区月島",
      "wait": "-",
      "move": "60",
      "check": "true",
      "image_path":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREJZN_nzPFmQ5TEmmaT4hyHBDEvdaIz2baXxwF63g9DvlBr6YyvMvyXTXBB2s&s"
    },
    {
      "spot": "皇居",
      "way": "東京都千代田",
      "wait": "-",
      "move": "60",
      "check": "true",
      "image_path":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_mU4aeK6Xh5Df8HYXU-82fW9u4XBXC2L0Hq8E7xahRDlNCzRPyaOvoob2Npw&s"
    },
  ];

  //画面に描画するデータリスト作成
  @override
  Widget build(BuildContext context) {
    final List<Widget> _SpotHistoryListWidgets = <Widget>[];
    for (var info in favorite_list) {
      _SpotHistoryListWidgets.add(Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: FavoriteElement(
          title: info["spot"] ?? "",
          way: info["way"] ?? "",
          wait: info["wait"] ?? "",
          move: info["move"] ?? "",
          check: info["check"] ?? "",
          image: info["image_path"] ?? "",
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
              SubTitleElement(title: 'お気に入りの登録'),
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
                  onPressed: () => Navigator.of(context).pop(favorite_list),
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
  var joiner_list = [
    {"name": "たつや", "check": "true"},
    {"name": "りしゅん", "check": "true"},
    {"name": "りょうが", "check": "false"},
  ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> _AddJoinersModalWidgets = <Widget>[];
    for (var info in joiner_list) {
      _AddJoinersModalWidgets.add(Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: AddJoinerElement(
          name: info["name"] ?? "",
          check: info["check"] ?? "",
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
