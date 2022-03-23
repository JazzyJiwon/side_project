import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용하기 위함
  await Firebase.initializeApp(); // firebase 앱 시작
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

const distance = 16.0;
int job_count = 1;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool clicked = false;
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          '모집 글쓰기',
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    width: 300,
                    color: Colors.white.withOpacity(0.5),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(distance),
              child: Form(
                key: fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' * 프로젝트 명',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '❗ 직관적인 이름을 사용하시면 클릭률이 올라갑니다.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 1,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: '',
                        filled: true,
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide: BorderSide(
                            color: Colors.blue,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                    Text('* 모집인원'),
                    Text(
                      '❗ 최대 6명까지 모집이 가능하며, 3~4명을 추천합니다.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: job_count,
                      itemBuilder: (context, index) {
                        return Recruit();
                      },
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey[300]),
                                elevation: MaterialStateProperty.all(10),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.grey[200])),
                            onPressed: () {
                              setState(() {
                                if (job_count < 3) {
                                  job_count = job_count + 1;
                                } else if (job_count == 3) {
                                  job_count = 3;
                                }
                              });
                            },
                            child: Text(
                              '추가',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey[300]),
                                elevation: MaterialStateProperty.all(10),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.grey[200])),
                            onPressed: () {
                              setState(() {
                                if (job_count > 1) {
                                  job_count = job_count - 1;
                                } else if (job_count == 1) {
                                  job_count = 1;
                                }
                              });
                            },
                            child: Text(
                              '삭제',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                    Text(
                      ' * 프로젝트 설명',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '❗ 설명이 풍부한 프로젝트는, 아닌 프로젝트에 비해 지원율이 50% 높습니다.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' 1. 시작 동기',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 50,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText:
                            '-왜 이 서비스를 만드시고 싶으신지 적어주세요.\n- 어떤 사용자들을 타겟하고 있는지 적어주세요.',
                        filled: true,
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide: BorderSide(
                            color: Colors.blue,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      ' 2. 회의 진행/모임 방식',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 50,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText:
                            '-1주에 몇번 정도 모임을 진행하실 계획이신가요?\n-회의는 오프라인인가요? 진행방식을 적어주세.',
                        filled: true,
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide: BorderSide(
                            color: Colors.blue,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      ' 3. 그외 자유기재',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 50,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: '-자유롭게 기입해주세요.',
                        filled: true,
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide: BorderSide(
                            color: Colors.blue,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Recruit extends StatefulWidget {
  const Recruit({Key? key}) : super(key: key);

  @override
  State<Recruit> createState() => _RecruitState();
}

class _RecruitState extends State<Recruit> {
  final _items = ['디자인', '개발', '기타'];
  var _selected = '디자인';
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 140,
            height: 50,
            child: DropdownButton(
              isExpanded: true,
              value: _selected,
              items: _items
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(
                  () {
                    _selected = value as String;
                  },
                );
              },
            ),
          ),
          SizedBox(
            width: 50,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (number > 1) {
                  number = number - 1;
                } else if (number == 1) {
                  number = 1;
                }
              });
            },
            child: Icon(
              CupertinoIcons.minus,
              size: 20,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            '$number',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (number < 6) {
                  number = number + 1;
                } else if (number == 6) {
                  number = 6;
                }
              });
            },
            child: Icon(
              CupertinoIcons.plus,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
