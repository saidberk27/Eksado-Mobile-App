import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Database {
  // Create a new document with auto-generated documentId
  Future<String> createDocument(
      String collection, Map<String, dynamic> data) async {
    print(data);
    DocumentReference documentReference =
        await FirebaseFirestore.instance.collection(collection).add(data);
    if (kDebugMode) {
      print('Document created with id: ${documentReference.id}');
    }
    return documentReference.id;
  }

  // Read a document
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

  // Update a document
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

  // Delete a document
  Future<void> deleteDocument(String collection, String documentId) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .delete();
    if (kDebugMode) {
      print('Document deleted');
    }
  }

  // Get all documents of a collection
  Future<List<DocumentSnapshot>> getAllDocuments(String collection) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    List<DocumentSnapshot> documents = querySnapshot.docs;
    if (kDebugMode) {
      print('All documents in collection: $documents');
    }
    return documents;
  }
}
