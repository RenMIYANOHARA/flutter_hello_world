import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Service/api_helper.dart';
import 'view/a_001.dart';

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
              'Top Page',
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
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              )
            },
            // tooltip : ボタンを長押し or カーソルを合わせると'Increment'を表示
            tooltip: 'Go to Calculator Page',
            // ボタンオブジェクト内に表示させるテキスト
            child: const Text('>>'),
          ),
        ],
      )
    );
  }
}
