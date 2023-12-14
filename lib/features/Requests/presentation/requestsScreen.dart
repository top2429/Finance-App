import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/features/Requests/data/requests_repository.dart';
import 'package:tai/features/Requests/presentation/paymentRequestDetailsCard.dart';
import 'package:tai/features/Requests/presentation/requestCard.dart';
import 'package:tai/features/authentication/presentation/current_user_controller.dart';


class RequestsScreen extends ConsumerWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    String userId = ref.read(currentUserControllerProvider).userId!;
    var value = ref.watch(requestsListStreamProvider(userId));
    return value.when(
        data: (requests) => Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Payment requests",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: requests.length,
                          itemBuilder: (_, index) {
                            var data = requests[index];

                            if (userId == data.receiverId) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: RequestCard(
                                    natureOfRequest: data.reason!,
                                    senderImage: data.senderImage!,
                                    senderName: data.senderName!,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentRequestedDetails(
                                                    senderName:
                                                        data.senderName!,
                                                    amount: data.amount!,
                                                    reason: data.reason!,
                                                    time: data.time!,
                                                  )));
                                    }),
                              );
                            }

                            /// this return of container should not be return null
                            /// returning null breaks the loop and the builder doesnt iterate through all
                            /// the items in the list
                            return Container();
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        error: (e, st) {
          return Center(
            child: Text("$e the data is not being read from the stream"),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
