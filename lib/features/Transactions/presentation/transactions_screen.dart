import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/features/Transactions/data/transactions_repository.dart';
import 'package:tai/features/Transactions/presentation/transactions_history_widget.dart';
import 'package:tai/features/authentication/presentation/current_user_controller.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String userId = ref.read(currentUserControllerProvider).userId!;
    var value = ref.watch(transactionsListStreamProvider(userId));
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text(
            "Transactions history",
            style: TextStyle(fontSize: 19),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TransactionsHistoryWidget(userId: userId, value: value),
          ),
        ));
  }
}
