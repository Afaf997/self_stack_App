
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String name;
  final DateTime date;

  Event(this.name, this.date);
}


class EventBloc {
  final List<Event> eventSource = [
    Event('Event 1', DateTime(2024, 2, 15, 10, 0)),
    Event('Event 2', DateTime(2024, 2, 16, 14, 30)),
    Event('Event 3', DateTime(2024, 2, 17, 9, 0)),
  ];

  List<Event> getEventsForDay(DateTime day) {
    return eventSource.where((event) => isSameDay(event.date, day)).toList();
  
  }
}