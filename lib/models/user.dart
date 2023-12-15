import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;

// constructor
  const User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'uid': uid,
        'photoUrl': photoUrl,
      };

  // Convert snapshot from firebase firestore to json(userModel)
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
      photoUrl: snapshot['photoUrl'],
      username: snapshot['username'],
    );
  }
}
