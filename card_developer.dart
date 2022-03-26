import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:side_project/side_service.dart';

import '../detail_page.dart';

class cardDeveloper extends StatelessWidget {
  const cardDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SideService>(
      builder: (context, sideService, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "모집중",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 120,
                child: FutureBuilder<QuerySnapshot>(
                    future: sideService.read(),
                    builder: (context, snapshot) {
                      final documents = snapshot.data?.docs ?? [];
                      if (documents.isEmpty) {
                        return Center(child: Text('아직 모집중인 사이드 프로젝트가 없습니다.'));
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          final doc = documents[index];
                          String projectname = doc.get('projectname');
                          String username = doc.get('username');
                          List recruit = doc.get('recruit')['number'];
                          int total = 0;
                          for (var item in recruit) {
                            total = total + item as int;
                          }

                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        DetailPage(username: username),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 120,
                                child: Column(
                                  children: [
                                    SizedBox(height: 5),
                                    Text(username + '님의 모임'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      projectname,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('모집인원 :' + '$total')
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ),
          ],
        );
      },
    );
  }
}
