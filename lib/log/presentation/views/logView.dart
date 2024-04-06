import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rolla_task/log/presentation/widgets/log_card.dart';

final maxCardCountProvider = Provider<int>((_) => 30);

class LogView extends HookConsumerWidget {
  LogView(
      {super.key,
      required this.createdAt,
      required this.actorUsername,
      required this.payloadDescription,
      required this.eventType});

  final String? eventType;
  final String? actorUsername;
  final String? payloadDescription;
  final int? createdAt;

  final logCards = 6;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(42, 45, 53, 1),
      body: LogCard(
        eventType: eventType,
        actorUsername: actorUsername,
        payloadDescription: payloadDescription,
        createdAt: createdAt,
      ),
    );
  }
}
