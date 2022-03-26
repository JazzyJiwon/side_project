import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SideService extends ChangeNotifier {
  final sideCollection = FirebaseFirestore.instance.collection('project');

  Future<QuerySnapshot> read() async {
    return sideCollection.get();
  }

  Future<QuerySnapshot> detailread(String username) async {
    return sideCollection.where('username', isEqualTo: username).get();
  }

  void create(
    String username,
    String motive,
    String projectname,
    String method,
    String extra,
    Map recruit,
  ) async {
    await sideCollection.add({
      'projectname': projectname,
      'username': username,
      'motive': motive,
      'method': method,
      'extra': extra,
      'recruit': recruit,
    });
    notifyListeners();
  }
}
