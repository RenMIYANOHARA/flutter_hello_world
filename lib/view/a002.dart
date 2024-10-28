import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

// 遷移先の画面 (状態が変わる)
class A002 extends StatefulWidget {
  const A002({super.key});

  @override
  State<A002> createState() => _A002State();
}

class _A002State extends State<A002> {
  // ジャイロセンサの値
  double _gyroX = 0, _gyroY = 0, _gyroZ = 0;

  // 加速度センサ（重力の影響あり）の値
  double _accelX = 0, _accelY = 0, _accelZ = 0;

  // 加速度センサ（重力の影響なし）の値
  double _userAccelX = 0, _userAccelY = 0, _userAccelZ = 0;

  // 磁場センサの値
  double _magX = 0, _magY = 0, _magZ = 0;

  @override
  void initState() {
    super.initState();

    // ジャイロセンサのデータをリスン
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroX = event.x;
        _gyroY = event.y;
        _gyroZ = event.z;
      });
    });

    // 加速度センサ（重力の影響あり）のデータをリスン
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelX = event.x;
        _accelY = event.y;
        _accelZ = event.z;
      });
    });

    // 加速度センサ（重力の影響なし）のデータをリスン
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelX = event.x;
        _userAccelY = event.y;
        _userAccelZ = event.z;
      });
    });

    // 磁場センサのデータをリスン
    magnetometerEvents.listen((MagnetometerEvent event) {
      setState(() {
        _magX = event.x;
        _magY = event.y;
        _magZ = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A002 Gyroscope Sensor Data'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '回転速度',
              // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.purpleAccent, // ここで色を指定
              ),
            ),
            Text(
              '(X, Y, Z): (${_gyroX.toStringAsFixed(2)}, ${_gyroY.toStringAsFixed(2)}, ${_gyroZ.toStringAsFixed(2)})',
              // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.purpleAccent, // ここで色を指定
                  fontSize: 20
              ),
            ),
            SizedBox(height: 30),
            Text(
              '加速度（重力の影響あり）',
              // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.purpleAccent, // ここで色を指定
              ),
            ),
            Text(
              '(X, Y, Z): (${_accelX.toStringAsFixed(2)}, ${_accelY.toStringAsFixed(2)}, ${_accelZ.toStringAsFixed(2)})',
              // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.purpleAccent, // ここで色を指定
                  fontSize: 20
              ),
            ),
            SizedBox(height: 30),
            Text(
              '加速度（重力の影響なし）',
              // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.purpleAccent, // ここで色を指定
              ),
            ),
            Text(
              '(X, Y, Z): (${_userAccelX.toStringAsFixed(2)}, ${_userAccelY.toStringAsFixed(2)}, ${_userAccelZ.toStringAsFixed(2)})',
              // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.purpleAccent, // ここで色を指定
                  fontSize: 20
              ),
            ),
            SizedBox(height: 30),
            Text(
              '磁場',
              // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.purpleAccent, // ここで色を指定
              ),
            ),
            Text(
              '(X, Y, Z): (${_magX.toStringAsFixed(2)}, ${_magY.toStringAsFixed(2)}, ${_magZ.toStringAsFixed(2)})',
              // アプリのテーマで定義された「中サイズの見出しスタイル」を適用
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.purpleAccent, // ここで色を指定
                  fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}