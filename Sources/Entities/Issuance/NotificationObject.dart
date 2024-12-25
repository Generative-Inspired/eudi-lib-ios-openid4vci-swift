
import 'package:openid4vci/src/entities/issuance/credential_issuance_event.dart';
import 'package:openid4vci/src/entities/types/notification_id.dart';

class NotificationId {
  final String value;
  
  NotificationId({required this.value}) {
    if (value.isEmpty) {
      throw Exception("Empty NotificationId");
    }
  }
}

class NotificationObject {
  final NotificationId id;
  final NotifiedEvent event;
  final String? eventDescription;
  
  NotificationObject({
    required this.id,
    required this.event,
    this.eventDescription,
  });

  Map<String, dynamic> toDictionary() {
    final Map<String, dynamic> dictionary = {
      'id': id.value,
      'event': event.name,
    };
    if (eventDescription != null) {
      dictionary['eventDescription'] = eventDescription;
    }
    return dictionary;
  }
}

enum NotifiedEvent {
  credentialAccepted,
  credentialFailure,
  credentialDeleted;

  String get rawValue {
    switch (this) {
      case NotifiedEvent.credentialAccepted:
        return 'CREDENTIAL_ACCEPTED';
      case NotifiedEvent.credentialFailure:
        return 'CREDENTIAL_FAILURE';
      case NotifiedEvent.credentialDeleted:
        return 'CREDENTIAL_DELETED';
    }
  }
}
