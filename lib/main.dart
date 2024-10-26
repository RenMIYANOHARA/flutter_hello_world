import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
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
  int _counter = 0;

  void _incrementCounter(int increment) {
    // ボタンを押下するごとにカウントする関数
    setState(() {
      _counter += increment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 現在のテーマの「逆のプライマリーカラー」を取得
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // 要素の配置位置を縦方向の中央に配置
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count : $_counter',
              // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed : ボタンを押下した際のイベント
        onPressed: () => _incrementCounter(1),
        // tooltip : ボタンを長押し or カーソルを合わせると'Increment'を表示
        tooltip: 'Increment',
        // ボタンオブジェクト内に表示させるテキスト
        child: const Text('+1'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
