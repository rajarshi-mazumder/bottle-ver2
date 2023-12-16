import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bottle_ver2/dbOperations/dbManager.dart';
import 'package:flutter/material.dart';

import '../models/customUser.dart';

class UserProvider with ChangeNotifier {
  List<CustomUser> allUsers = [];
  Stream<QuerySnapshot>? usersStream;
  CustomUser? loggedInUser;

  UserProvider() {
    // getAllUsersStream();
  }

  Future getAllUsersStream() async {
    usersStream = db.collection('users').snapshots();
    print("FETCHING ALL USERS");
    usersStream!.listen((snapshot) {
      List<CustomUser> usersList = [];

      snapshot.docs.forEach((element) {
        usersList
            .add(CustomUser.fromMap(element.data() as Map<String, dynamic>));
      });

      allUsers.clear();
      allUsers.addAll(usersList);
      print("GOT ALL USERS ${allUsers}");
      notifyListeners();
      // return usersStream;
    });
  }

  setLoggedInUser(String email) async {
    allUsers.forEach((element) {
      if (element.email == email) {
        loggedInUser = element;

        notifyListeners();
      }
    });
  }

  silentlySetLoggedInUser(String email) async {
    allUsers.forEach((element) {
      if (element.email == email) {
        loggedInUser = element;
      }
    });
  }
}
