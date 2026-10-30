import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enntly/models/event_model.dart';

class DbServes {
  static FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  static Future<void> addEvent(EventModel event) async {
    var docRef = _firestore.collection("users").doc();
    event.id = docRef.id;
    await docRef.set(event.toJson());
  }

  static Future<void> updateEvent(EventModel event) async {
    if (event.id == null || event.id!.isEmpty) return;
    await _firestore
        .collection("users")
        .doc(event.id)
        .set(event.toJson(), SetOptions(merge: true));
  }

  static Future<List<EventModel>> getEvents() async {
    var res = await _firestore.collection("users").get();
    return res.docs.map((doc) {
      var event = EventModel.fromJson(doc.data());
      event.id = doc.id;
      return event;
    }).toList();
  }
}
