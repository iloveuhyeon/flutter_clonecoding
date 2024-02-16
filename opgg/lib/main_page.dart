import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField 예제'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              onChanged: (text) {
                _displayText = text;
              },
              decoration: const InputDecoration(
                labelText: '플레이어 닉네임',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => setState(() {}),
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                height: 40,
                width: 80,
                child: const Text("입력"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '입력값: $_displayText',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
