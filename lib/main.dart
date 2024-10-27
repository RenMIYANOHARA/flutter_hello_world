import 'package:flutter/material.dart';
import 'Service/api_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// https://chatgpt.com/share/671cfe56-e934-800c-a558-87b81006d347
void main() {
  // アプリを起動
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // StatelessWidget : 「変化しない」Widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // アプリのテーマカラーを設定
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3 : Googleが提供する最新のデザインスタイル
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // StatefulWidget : 「変化する」Widget
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  // createState : 変化する」クラスを作成するメソッド
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        // HomePageの背景色を定義
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
            // ボタンオブジェクト内に表示させるテキスト
            child: const Text('A -1'),
          ),
          const SizedBox(width: 5), // ボタン間の間隔
          FloatingActionButton(
            // onPressed : ボタンを押下した際のイベント
            onPressed: () => _incrementA(1),
            // tooltip : ボタンを長押し or カーソルを合わせると'Increment'を表示
            tooltip: 'Increment',
            // ボタンオブジェクト内に表示させるテキスト
            child: const Text('A +1'),
          ),
          const SizedBox(width: 5), // ボタン間の間隔
          FloatingActionButton(
            // onPressed : ボタンを押下した際のイベント
            onPressed: () => _incrementB(-1),
            // tooltip : ボタンを長押し or カーソルを合わせると'Increment'を表示
            tooltip: 'Increment',
            // ボタンオブジェクト内に表示させるテキスト
            child: const Text('B -1'),
          ),
          const SizedBox(width: 5), // ボタン間の間隔
          FloatingActionButton(
            // onPressed : ボタンを押下した際のイベント
            onPressed: () => _incrementB(1),
            // tooltip : ボタンを長押し or カーソルを合わせると'Increment'を表示
            tooltip: 'Increment',
            // ボタンオブジェクト内に表示させるテキスト
            child: const Text('B +1'),
          ),
        ],
      )
    );
  }
}
