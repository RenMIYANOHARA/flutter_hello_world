import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Service/api_helper.dart';

// 遷移先の画面 (状態が変わる)
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _a = 0;
  int _b = 0;
  int _sum = 0;

  void _incrementA(int increment) async {
    // ボタンを押下するごとにカウントする関数
    _a += increment;

    http.Response response;
    response = await ApiHelper().apiRequest(
        'post',
        'https://l6meqb42wf.execute-api.ap-northeast-1.amazonaws.com/develop/main',
        null,
        {
          'key1': _a,
          'key2': _b,
        }
    );
    final data = json.decode(response.body);
    setState(() {
      _a;
      _sum = data['sum'];
    });
  }

  void _incrementB(int increment) async {
    // ボタンを押下するごとにカウントする関数
    _b += increment;

    http.Response response;
    response = await ApiHelper().apiRequest(
        'post',
        'https://l6meqb42wf.execute-api.ap-northeast-1.amazonaws.com/develop/main',
        null,
        {
          'key1': _a,
          'key2': _b,
        }
    );
    final data = json.decode(response.body);
    setState(() {
      _b;
      _sum = data['sum'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            // 要素の配置位置を縦方向の中央に配置
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'A : $_a',
                // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white, // ここで色を指定
                ),
              ),
              Text(
                'B : $_b',
                // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white, // ここで色を指定
                ),
              ),
              Text(
                'A + B = $_sum',
                // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white, // ここで色を指定
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // child    : Widget単体
          // children : Widget配列
          children: <Widget>[
            FloatingActionButton(
              // onPressed : ボタンを押下した際のイベント
              onPressed: () => _incrementA(-1),
              // tooltip : ボタンを長押し or カーソルを合わせると'Increment'を表示
              tooltip: 'Increment',
              // Heroアニメーションを無効化
              heroTag: null,
              // ボタンオブジェクト内に表示させるテキスト
              child: const Text('A -1'),
            ),
            const SizedBox(width: 5), // ボタン間の間隔
            FloatingActionButton(
              // onPressed : ボタンを押下した際のイベント
              onPressed: () => _incrementA(1),
              // tooltip : ボタンを長押し or カーソルを合わせると'Increment'を表示
              tooltip: 'Increment',
              // Heroアニメーションを無効化
              heroTag: null,
              // ボタンオブジェクト内に表示させるテキスト
              child: const Text('A +1'),
            ),
            const SizedBox(width: 5), // ボタン間の間隔
            FloatingActionButton(
              // onPressed : ボタンを押下した際のイベント
              onPressed: () => _incrementB(-1),
              // tooltip : ボタンを長押し or カーソルを合わせると'Increment'を表示
              tooltip: 'Increment',
              // Heroアニメーションを無効化
              heroTag: null,
              // ボタンオブジェクト内に表示させるテキスト
              child: const Text('B -1'),
            ),
            const SizedBox(width: 5), // ボタン間の間隔
            FloatingActionButton(
              // onPressed : ボタンを押下した際のイベント
              onPressed: () => _incrementB(1),
              // tooltip : ボタンを長押し or カーソルを合わせると'Increment'を表示
              tooltip: 'Increment',
              // Heroアニメーションを無効化
              heroTag: null,
              // ボタンオブジェクト内に表示させるテキスト
              child: const Text('B +1'),
            ),
          ],
        )
    );
  }
}