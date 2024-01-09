import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Database {
  Future<String> createDocument(
      String collection, Map<String, dynamic> data) async {
    print(data);

    String documentId =
        FirebaseFirestore.instance.collection(collection).doc().id;

    data['documentId'] = documentId;

    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .set(data);

    if (kDebugMode) {
      print('Document created with id: $documentId');
    }

    return documentId;
  }

  Future<DocumentSnapshot> readDocument(
      String collection, String documentId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .get();
    if (kDebugMode) {
      print('Document read: ${documentSnapshot.data()}');
    }
    return documentSnapshot;
  }

  Future<void> updateDocument(
      String collection, String documentId, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .update(data);
    if (kDebugMode) {
      print('Document updated');
    }
  }

  Future<void> deleteDocument(String collection, String documentId) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .delete();
    if (kDebugMode) {
      print('Document deleted');
    }
  }

  Future<List<DocumentSnapshot>> getAllDocuments(String collection) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    List<DocumentSnapshot> documents = querySnapshot.docs;
    if (kDebugMode) {
      print('All documents in collection: $documents');
    }
    return documents;
  }

  Future<QuerySnapshot> getDocumentsWithFilter(
      {required String collectionName,
      required String field,
      required String equalTo}) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .where(field, isEqualTo: equalTo)
        .get();
  }
}
