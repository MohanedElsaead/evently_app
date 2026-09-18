import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  static const String collectionName = "Events";

  String id;
  String title;
  String description;
  String categoryName;
  int categoryIndex;
  DateTime dateTime;
  String time;
  String userId;
  bool isFavorite;

  EventModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.categoryName,
    required this.categoryIndex,
    required this.dateTime,
    required this.time,
    required this.userId,
    this.isFavorite = false,
  });

  EventModel.fromFireStore(Map<String, dynamic> data)
      : this(
          id: data['id'] ?? "",
          title: data['title'] ?? "",
          description: data['description'] ?? "",
          categoryName: data['categoryName'] ?? "",
          categoryIndex: data['categoryIndex'] ?? 0,
          dateTime: (data['dateTime'] as Timestamp).toDate(),
          time: data['time'] ?? "",
          userId: data['userId'] ?? "",
          isFavorite: data['isFavorite'] ?? false,
        );

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'categoryName': categoryName,
      'categoryIndex': categoryIndex,
      'dateTime': Timestamp.fromDate(dateTime),
      'time': time,
      'userId': userId,
      'isFavorite': isFavorite,
    };
  }
}
