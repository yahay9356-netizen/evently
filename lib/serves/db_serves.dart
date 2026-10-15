import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enntly/models/event_model.dart';

class DbServes {
  static FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  static Future<void> addEvent(EventModel event) async {
    await _firestore.collection("users").doc().set(event.toJson());
  }

  static Future<List<EventModel>> getEvents() async {
    var res = await _firestore.collection("users").get();
    return res.docs.map((doc) => EventModel.fromJson(doc.data())).toList();
  }
}
