import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        height: 30,
        color: Colors.white,
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              labelText: "프로젝트 키워드를 입력해주세요",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
