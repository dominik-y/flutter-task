import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rolla_task/resources.dart';

class LogCard extends HookConsumerWidget {
  final String? eventType;
  final String? actorUsername;
  final String? payloadDescription;
  int? createdAt = 0;

  LogCard(
      {super.key,
      this.createdAt,
      this.actorUsername,
      this.payloadDescription,
      this.eventType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: 6 / 2,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColor.neutral2,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Event Type: {card.eventType}',
                  style: TextStyle(color: AppColor.white),
                ),
                Text(
                  'Created At: {card.formattedCreatedAt}',
                  style: TextStyle(color: AppColor.white),
                ),
                Text(
                  'Actor Username: {card.actorUsername}',
                  style: TextStyle(color: AppColor.white),
                ),
                Text(
                  'Payload Description: {card.payloadDescription}',
                  style: TextStyle(color: AppColor.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
