import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool clicked = false;
  final fromKey = GlobalKey<FormState>();

  final _items = ['디자인', '개발', '기타'];
  var _selected = '디자인';
  int number = 1;

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
          child: Padding(
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
                    maxLines: 10,
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
                  Row(
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
                            number = number - 1;
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
                            number = number + 1;
                          });
                        },
                        child: Icon(
                          CupertinoIcons.plus,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  AnimatedContainer button() {
    return AnimatedContainer(
      width: 200,
      height: 200,
      child: Icon(
        Icons.star,
        color: Colors.grey[400],
        size: 50,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(
            10,
          ),
          boxShadow: clicked
              ? null
              : [
                  BoxShadow(
                    offset: Offset(distance, distance),
                    color: Colors.black26,
                    blurRadius: distance,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    offset: Offset(-distance, -distance),
                    color: Colors.white70,
                    blurRadius: distance,
                    spreadRadius: 2,
                  )
                ]),
      duration: Duration(
        seconds: 1,
      ),
      curve: Curves.fastOutSlowIn,
    );
  }
}
