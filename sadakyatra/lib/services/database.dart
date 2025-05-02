import 'package:cloud_firestore/cloud_firestore.dart';

// Create
class DatabaseMethod {
  // Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
  //   return await FirebaseFirestore.instance
  //       .collection("sadakyatra")
  //       .doc(id)
  //       .set(userInfoMap);
  // }

  Future<void> addUserDetails(
      Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("sadakyatra")
        .doc("userDetailsDatabase")
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

// Read
  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return FirebaseFirestore.instance.collection("Employee").snapshots();
  }

// Update
  Future updateUserDetail(
      String id, Map<String, dynamic> updateUserInfo) async {
    return await FirebaseFirestore.instance
        .collection("sadakyatra")
        .doc("userDetailsDatabase")
        .collection("users")
        .doc(id)
        .update(updateUserInfo);
  }

// Delete
  Future deleteUserDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("sadakyatra")
        .doc("userDetailsDatabase")
        .collection("users")
        .doc(id)
        .delete();
  }
}
