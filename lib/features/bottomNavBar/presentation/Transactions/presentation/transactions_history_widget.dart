import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/features/bottomNavBar/presentation/Transactions/domain/transactionsModel.dart';

class TransactionsHistoryWidget<T> extends StatefulWidget {
  const TransactionsHistoryWidget({super.key, required this.userId, required this.value,this.forHomeScreen= false });
  final String userId;
  final AsyncValue<T> value;
  final bool forHomeScreen;

  @override
  State<TransactionsHistoryWidget> createState() => _TransactionsHistoryWidgetState();
}

class _TransactionsHistoryWidgetState extends State<TransactionsHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.value.when(
          data: (transactions) {
            return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: widget.forHomeScreen? 5:transactions.length,
                itemBuilder: (_, index) {
                  TransactionsModel data = transactions[index];
                  if (transactions.isEmpty) {
                    return const Center(
                      child: Text("You have no transactions"),
                    );
                  }

                  if (widget.userId == data.senderId) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(24)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 23,
                                    backgroundImage: Image.asset(
                                      "assets/images/${data.receiverImage}",
                                      fit: BoxFit.cover,
                                    ).image,
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 150,
                                        child: Text(
                                            "Sent to ${data.receiverName}",
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text("${data.time}")
                                    ],
                                  )
                                ],
                              ),
                              Text("UGX ${data.amount}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    // fontSize: 16),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  if (widget.userId == data.receiverId) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(24)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 23,
                                    backgroundImage: Image.asset(
                                      "assets/images/${data.senderImage}",
                                      fit: BoxFit.cover,
                                    ).image,
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 150,
                                        child: Text(
                                            "Sent from ${data.senderName}",
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text("${data.time}")
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                "UGX ${data.amount}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  /// this return of container should not be return null
                  /// returning null breaks the loop and the builder doesnt iterate through all
                  /// the items in the list
                  return Container();
                });
          },
          error: (e, st) {
            return Center(
              child: Text("$e the data is not being read from the stream"),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()));
  }
}