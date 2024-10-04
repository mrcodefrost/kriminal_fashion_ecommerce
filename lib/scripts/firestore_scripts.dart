import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/utils.dart';

class FirestoreScripts {
  // Function to remove old fields from Firestore
  Future<void> removeOldFieldsFromFirestore(String collection, List<String> removeFields) async {
    // Reference to the Firestore collection
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection(collection);

    // Get all documents in the collection
    QuerySnapshot querySnapshot = await collectionRef.get();

    // Iterate over each document in the collection
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      // Create a map to hold the fields to be deleted
      Map<String, dynamic> updates = {};

      // Add the fields to be deleted to the map
      for (String field in removeFields) {
        updates[field] = FieldValue.delete();
      }

      // Update the document to delete the specified fields
      await collectionRef.doc(doc.id).update(updates);
      logg.d('Old fields removed from document with ID: ${doc.id}');
    }
  }

  // Function to add new field to Firestore
  Future<void> addNewFieldToFirestoreEntries(String newFieldName, String collection, dynamic value) async {
    // Reference to the Firestore collection
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection(collection);

    // Get all documents in the collection
    QuerySnapshot querySnapshot = await collectionRef.get();

    // Iterate over each document in the collection
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      // Create a map to hold the new field and its value
      Map<String, dynamic> updates = {
        newFieldName: value,
      };

      // Update the document to add the new field
      await collectionRef.doc(doc.id).update(updates);
      logg.d('New field "$newFieldName" added to document with ID: ${doc.id}');
    }
  }
}
