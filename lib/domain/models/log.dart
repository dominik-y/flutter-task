import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log.freezed.dart';
part 'log.g.dart';

@freezed
class Log with _$Log {
  const factory Log({
    required String id,
    String? type,
    String? payload,
    String? public,
    DateTime? createdAt,
  }) = _Log;

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
}

class Actor {
  int id;
  String login;

  Actor({
    required this.id,
    required this.login,
  });
}

class Payload {
  String? description;

  Payload({
    this.description,
  });
}
