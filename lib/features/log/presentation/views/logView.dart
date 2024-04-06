import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rolla_task/features/log/presentation/widgets/log_card.dart';
import 'package:rolla_task/resources.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

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

  final logCards = [0, 1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.neutral1,
      body: ListView.builder(
        itemCount: logCards.length,
        itemBuilder: (context, index) {
          final card = logCards[index];
          return LogCard(
            createdAt: createdAt,
            actorUsername: actorUsername,
            payloadDescription: payloadDescription,
            eventType: eventType,
          );
        },
      ),
    );
  }
}
