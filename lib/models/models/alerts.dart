import 'package:flutter/foundation.dart';

class Alerts {
  List<dynamic>? alert;

  Alerts({this.alert});

  factory Alerts.fromJson(Map<String, dynamic> json) => Alerts(
        alert: json['alert'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'alert': alert,
      };

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Alerts) return false;
    return listEquals(other.alert, alert);
  }

  @override
  int get hashCode => alert.hashCode;
}
