import 'dart:async';

import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  List<EventModel> events = [];
  StreamSubscription<List<EventModel>>? _eventsSubscription;

  void loadEvents(String userId) {
    _eventsSubscription?.cancel();
    _eventsSubscription = FirebaseUtils.getEventsStream(userId).listen((eventList) {
      events = eventList;
      notifyListeners();
    });
  }

  List<EventModel> getFilteredEvents(String category) {
    if (category.toLowerCase() == "all" || category == "الكل") {
      return events;
    }
    return events
        .where((event) =>
            event.categoryName.toLowerCase() == category.toLowerCase())
        .toList();
  }

  Future<void> addEvent(String userId, EventModel event) async {
    await FirebaseUtils.addEvent(userId, event);
  }

  Future<void> updateEvent(String userId, EventModel event) async {
    await FirebaseUtils.updateEvent(userId, event);
  }

  Future<void> deleteEvent(String userId, String eventId) async {
    await FirebaseUtils.deleteEvent(userId, eventId);
  }

  List<EventModel> get favoriteEvents {
    return events.where((event) => event.isFavorite).toList();
  }

  Future<void> toggleFavorite(String userId, EventModel event) async {
    event.isFavorite = !event.isFavorite;
    await FirebaseUtils.updateEvent(userId, event);
  }

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    super.dispose();
  }
}
