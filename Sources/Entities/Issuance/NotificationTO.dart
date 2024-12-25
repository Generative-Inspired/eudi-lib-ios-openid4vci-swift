
class NotificationTO {
  final String notificationId;
  final String event;
  final String? eventDescription;

  NotificationTO({
    required this.notificationId,
    required this.event,
    this.eventDescription,
  });

  Map<String, dynamic> toJson() => {
    'notification_id': notificationId,
    'event': event,
    if (eventDescription != null) 'event_description': eventDescription,
  };

  factory NotificationTO.fromJson(Map<String, dynamic> json) => NotificationTO(
    notificationId: json['notification_id'] as String,
    event: json['event'] as String,
    eventDescription: json['event_description'] as String?,
  );
}
