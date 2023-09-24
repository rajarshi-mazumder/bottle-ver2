import 'package:flutter/material.dart';

class CustomUser {
  String userId;
  String username;
  String email;
  String? profilePic;

  CustomUser({
    required this.userId,
    required this.username,
    required this.email,
    this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'profilePic': profilePic,
    };
  }

  factory CustomUser.fromMap(Map<String, dynamic> map) {
    return CustomUser(
        userId: map['userId'],
        username: map['username'],
        email: map['email'],
        profilePic: map['profilePic'] ?? '');
    // ..createdIssues = List<String>.from(map['createdIssues'] ?? [])
  }
}
