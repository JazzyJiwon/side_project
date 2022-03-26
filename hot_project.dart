import 'package:flutter/material.dart';

class hotProject extends StatelessWidget {
  const hotProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        height: 190,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Today's Project",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text("모집마감 D-2"),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text("프로젝트 제목"),
                    SizedBox(height: 10),
                    Text("프로젝트 내용을 담아야할지?")
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "3",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "/",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "4",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.person),
                  Text(
                    "47",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.message),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "22",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
