import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:side_project/side_service.dart';
import 'package:side_project/test/my_page.dart';
import 'package:side_project/widgets/card_designer.dart';
import 'package:side_project/widgets/card_developer.dart';
import 'package:side_project/widgets/hot_project.dart';
import 'package:side_project/widgets/search_bar.dart';
import 'package:side_project/writepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용하기 위함
  await Firebase.initializeApp(); // firebase 앱 시작
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SideService(),
        ),
      ],
      child: const MyApp(),
    ),
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

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 16,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Team Fluject",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              child: Row(
                children: [
                  IconButton(
                    visualDensity:
                        VisualDensity(horizontal: -4.0, vertical: -4.0),
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    visualDensity:
                        VisualDensity(horizontal: -4.0, vertical: -4.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.person_outline_sharp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  searchBar(),
                  hotProject(),
                  SizedBox(height: 10),
                  cardDeveloper(),
                  SizedBox(height: 10),
                  Positioned(
                    bottom: 10.0,
                    right: 16.0,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => WritePage()),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        size: 24,
                      ),
                      label: Text("프로젝트를 등록해주세요"),
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
