import 'package:flutter/material.dart';
import 'package:spajam2023_pre_front/component/SpotHistoryElement.dart';
import 'package:spajam2023_pre_front/component/SubTitleElement.dart';

/////////////// 旅行履歴ページ ///////////////
class RouteHistoryPage extends StatefulWidget {
  const RouteHistoryPage({Key? key}) : super(key: key);

  @override
  State<RouteHistoryPage> createState() => _RouteHistoryPageState();
}

class _RouteHistoryPageState extends State<RouteHistoryPage> {
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
              SubTitleElement(
                title: '今日のルート',
              ),
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(9.0),
                  child: Image.network(
                      'https://pbs.twimg.com/profile_banners/949674062187343878/1651581522/1500x500',
                      width: 400,
                      height: 100,
                      fit: BoxFit.fill),
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    width: 400,
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "次の目的地",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "東京タワー",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Column(
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  Text(
                                    '待ち',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '25分',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '待ち',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '25分',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ]),
              SpotHistoryList()
            ]),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          "次の行き先を探す",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromRGBO(94, 92, 222, 1),
      ),
    );
  }
}

class SpotHistoryList extends StatefulWidget {
  const SpotHistoryList({super.key});

  @override
  State<SpotHistoryList> createState() => _SpotHistoryListState();
}

class _SpotHistoryListState extends State<SpotHistoryList> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _SpotHistoryListWidgets = <Widget>[];
    for (String num in ["1", "2", "2", "2", "2"]) {
      _SpotHistoryListWidgets.add(
        Container(
          height: 30,
          child: CustomPaint(
            painter: _SamplePainter(),
          ),
        ),
      );
      _SpotHistoryListWidgets.add(Container(
        child: SpotHistoryElement(),
      ));
    }
    return SizedBox(
      height: 500,
      child: ListView(
        children: _SpotHistoryListWidgets,
      ),
    );
  }
}

class _SamplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Color.fromARGB(255, 0, 113, 139);
    paint.strokeWidth = 3;
    canvas.drawLine(Offset(20, 0), Offset(20, 30), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
