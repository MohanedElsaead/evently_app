import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/model/my_user.dart';

class FirebaseUtils {
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, _) =>
              MyUser.fromFireStore(snapshot.data()!),
          toFirestore: (user, _) => user.toFireStore(),
        );
  }

  static Future<void> addUserToFireStore(MyUser user) {
    return getUsersCollection().doc(user.uId).set(user);
  }

  static Future<MyUser?> readUserFromFireStore(String uId) async {
    var querySnapshot =
        await getUsersCollection().where('id', isEqualTo: uId).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data();
    }
    return null;
  }

  static CollectionReference<EventModel> getEventsCollection(String userId) {
    return getUsersCollection()
        .doc(userId)
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) =>
              EventModel.fromFireStore(snapshot.data()!),
          toFirestore: (event, _) => event.toFireStore(),
        );
  }

  static Future<void> addEvent(String userId, EventModel event) async {
    var docRef = getEventsCollection(userId).doc();
    event.id = docRef.id;
    return docRef.set(event);
  }

  static Stream<List<EventModel>> getEventsStream(String userId) {
    return getEventsCollection(userId)
        .orderBy('dateTime', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  static Future<void> updateEvent(String userId, EventModel event) {
    return getEventsCollection(userId).doc(event.id).set(event);
  }

  static Future<void> deleteEvent(String userId, String eventId) {
    return getEventsCollection(userId).doc(eventId).delete();
  }
}