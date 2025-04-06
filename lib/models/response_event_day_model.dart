class ResponseEventDayModel {
  ResponseEventDayModel({
    required this.isHoliday,
    required this.events,
  });

  final bool? isHoliday;
  final List<Event> events;

  ResponseEventDayModel copyWith({
    bool? isHoliday,
    List<Event>? events,
  }) {
    return ResponseEventDayModel(
      isHoliday: isHoliday ?? this.isHoliday,
      events: events ?? this.events,
    );
  }

  factory ResponseEventDayModel.fromJson(Map<String, dynamic> json){
    return ResponseEventDayModel(
      isHoliday: json["is_holiday"],
      events: json["events"] == null ? [] : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "is_holiday": isHoliday,
    "events": events.map((x) => x?.toJson()).toList(),
  };

}

class Event {
  Event({
    required this.description,
    required this.additionalDescription,
    required this.isHoliday,
    required this.isReligious,
  });

  final String? description;
  final String? additionalDescription;
  final bool? isHoliday;
  final bool? isReligious;

  Event copyWith({
    String? description,
    String? additionalDescription,
    bool? isHoliday,
    bool? isReligious,
  }) {
    return Event(
      description: description ?? this.description,
      additionalDescription: additionalDescription ?? this.additionalDescription,
      isHoliday: isHoliday ?? this.isHoliday,
      isReligious: isReligious ?? this.isReligious,
    );
  }

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(
      description: json["description"],
      additionalDescription: json["additional_description"],
      isHoliday: json["is_holiday"],
      isReligious: json["is_religious"],
    );
  }

  Map<String, dynamic> toJson() => {
    "description": description,
    "additional_description": additionalDescription,
    "is_holiday": isHoliday,
    "is_religious": isReligious,
  };

}
