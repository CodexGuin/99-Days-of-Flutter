// ignore_for_file: file_names, constant_identifier_names

import 'dart:convert';

Bus busFromJson(String str) => Bus.fromJson(json.decode(str));

String busToJson(Bus data) => json.encode(data.toJson());

class Bus {
  List<Service> services;

  Bus({required this.services});

  factory Bus.fromJson(Map<String, dynamic> json) => Bus(
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class Service {
  String no;
  String serviceOperator;
  Next next;
  Next? next2;
  Next? next3;

  Service(
      {required this.no,
      required this.serviceOperator,
      required this.next,
      this.next2,
      this.next3});

  factory Service.fromJson(Map<String, dynamic> json) => Service(
      no: json["no"],
      serviceOperator: json["operator"],
      next: Next.fromJson(json["next"]),
      next2: json["next2"] == null ? null : Next.fromJson(json["next2"]),
      next3: json["next3"] == null ? null : Next.fromJson(json["next3"]));

  Map<String, dynamic> toJson() => {
        "no": no,
        "operator": serviceOperator,
        "next": next.toJson(),
        if (next2 != null) "next2": next2!.toJson(),
        if (next3 != null) "next3": next3!.toJson()
      };
}

class Next {
  DateTime time;
  int durationMs;
  double? lat; // Nullable
  double? lng; // Nullable
  Load load;
  Feature feature;
  Type type;
  int visitNumber;
  String? originCode; // Nullable
  String? destinationCode; // Nullable

  Next({
    required this.time,
    required this.durationMs,
    this.lat, // Nullable
    this.lng, // Nullable
    required this.load,
    required this.feature,
    required this.type,
    required this.visitNumber,
    this.originCode, // Nullable
    this.destinationCode, // Nullable
  });

  factory Next.fromJson(Map<String, dynamic> json) => Next(
      time: DateTime.parse(json["time"]),
      durationMs: json["duration_ms"],
      lat: json["lat"]?.toDouble(),
      lng: json["lng"]?.toDouble(),
      load: loadValues.map[json["load"]]!,
      feature: featureValues.map[json["feature"]]!,
      type: typeValues.map[json["type"]]!,
      visitNumber: json["visit_number"],
      originCode: json["origin_code"],
      destinationCode: json["destination_code"]);

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "duration_ms": durationMs,
        "lat": lat,
        "lng": lng,
        "load": loadValues.reverse[load],
        "feature": featureValues.reverse[feature],
        "type": typeValues.reverse[type],
        "visit_number": visitNumber,
        "origin_code": originCode,
        "destination_code": destinationCode
      };
}

enum Feature { WAB }

final featureValues = EnumValues({"WAB": Feature.WAB});

enum Load { SDA, SEA }

final loadValues = EnumValues({"SDA": Load.SDA, "SEA": Load.SEA});

enum Type { SD, DD }

final typeValues = EnumValues({"SD": Type.SD, "DD": Type.DD});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
