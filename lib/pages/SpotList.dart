import 'package:flutter/material.dart';
import 'package:spajam2023_pre_front/component/JoinerElement.dart';
import 'package:spajam2023_pre_front/component/SpotElement.dart';
import 'package:spajam2023_pre_front/component/SubTitleElement.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert' show json;
import 'package:geolocator/geolocator.dart';
import 'package:spajam2023_pre_front/pages/RouteHistory.dart';

@JsonSerializable()
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
                SubTitleElement(title: '行きたいスポット'),
                _addButton(),
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
              SpotList(),
              // JoinerList(),
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
      _SpotListWidgets.add(InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Column(
                  children: <Widget>[
                    AlertDialog(
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    'https://pbs.twimg.com/profile_banners/949674062187343878/1651581522/1500x500',
                                    // width: double.infinity,
                                    // width: 200,
                                    height: 200,
                                    fit: BoxFit.fill),
                              ),
                              Container(
                                  padding: EdgeInsets.all(15),
                                  width: 400,
                                  height: 100,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '東京タワー',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                            ]),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Column(children: [
                                Text(
                                  '所在地',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff888888),
                                  ),
                                ),
                                Text(
                                  '〒105-0011 東京都港区芝公園４丁目２−８',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Column(children: [
                                Text(
                                  '平均待ち時間',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xff888888),
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '30分',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: const Text('ここに行く'),
                              onPressed: () {
                                // 次ルートの選択ページへ遷移
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return RouteHistoryPage();
                                  }),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(
                                      94, 92, 222, 1), // background
                                  onPrimary: Colors.white, // foreground
                                  fixedSize: Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5) //こちらを適用
                                      )),
                            )),
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 15),
                            child: ElevatedButton(
                              child: const Text('キャンセル'),
                              onPressed: () {
                                // ダイアログを閉じる
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffdddddd), // background
                                  onPrimary: Color(0xff222222), // foreground
                                  fixedSize: Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10) //こちらを適用
                                      )),
                            )),
                      ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: Colors.white,
                    ),
                  ],
                );
              });
        },
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
  @override
  Widget build(BuildContext context) {
    final List<Widget> _JoinerListWidgets = <Widget>[];
    for (String num in ["1", "2"]) {
      _JoinerListWidgets.add(Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: JoinerElement(name: num),
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
          _request();
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
    )
  ]));
}

// 位置情報の取得
void getLocation() async {
  late StreamSubscription<Position> positionStream;
  Position? currentPosition;

  // 設定パラメータ
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high, //正確性:highはAndroid(0-100m),iOS(10m)
    distanceFilter: 100,
  );

  positionStream =
      Geolocator.getPositionStream(locationSettings: locationSettings)
          .listen((Position? position) {
    currentPosition = position;
    print(position == null
        ? 'Unknown'
        : '${position.latitude.toString()}, ${position.longitude.toString()}');
  });
}

// オススメスポットの取得
void _request() async {
  Uri url =
      Uri.parse('https://wanderist-server.azurewebsites.net/app/spot-list');
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };
  String body = json.encode({
    'lat': 0,
    'lng': 0,
    'user_id': 'test_user',
  });

  final response = await http.get(Uri.parse(
    'https://raw.githubusercontent.com/dev-yakuza/users/master/api.json',
  ));

  final resp = await http.post(url, headers: headers, body: body);

  print(resp.statusCode);
  print(resp.body);
  if (resp.statusCode != 200) {
    /*setState(() {
      int statusCode = resp.statusCode;
      _content = "Failed to post $statusCode";
    });*/
    return;
  }
  /*setState(() {
    _content = resp.body;
  });*/
}
