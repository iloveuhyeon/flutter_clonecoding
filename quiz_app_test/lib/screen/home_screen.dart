import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app_test/model/quiz_model.dart';
import 'package:quiz_app_test/screen/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a,b,c,d,e'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a,b,c,d,e'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a,b,c,d,e'],
      'answer': 0
    })
  ];
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    double width = screensize.width;
    double height = screensize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Quiz App'),
          backgroundColor: Colors.deepPurple,
          leading: Container(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                "asset/image/quiz.jpeg",
                width: width * 0.8,
              ),
            ),
            Padding(padding: EdgeInsets.all(width * 0.024)),
            Text(
              '플러터 퀴즈 앱 ',
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "퀴즈를 풀기전 안내사항입니다",
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(width * 0.048)),
            _buildStep(width, "1. 랜덤으로 나오는 퀴즈 3가지를 풀어보세요."),
            _buildStep(width, "2. 문제를 잘 읽고 정답을 고른 뒤\n다음 문제에 도전해보세요"),
            _buildStep(width, "3. 만점을 향해 도전하세요."),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.038),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: const Text(
                      "지금 퀴즈 풀기",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => QuizScreen(quizs: quizs)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildStep(double width, String title) {
  return Container(
    padding: EdgeInsets.fromLTRB(
      width * 0.048,
      width * 0.024,
      width * 0.048,
      width * 0.024,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_box,
          size: width * 0.04,
        ),
        Padding(
          padding: EdgeInsets.only(right: width * 0.024),
        ),
        Text(title),
      ],
    ),
  );
}
