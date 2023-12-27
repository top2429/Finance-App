// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sim_data/sim_data.dart';
// import 'package:sim_data/sim_model.dart';
// import 'package:tai/commonWidgets/mainButton.dart';
// import 'package:ussd_service/ussd_service.dart';

// class USSDTesting extends StatefulWidget {
//   const USSDTesting({super.key});

//   @override
//   State<USSDTesting> createState() => _USSDTestingState();
// }

// class _USSDTestingState extends State<USSDTesting> {
//   List<int> value = [];
//   @override
//   void didChangeDependencies() async {
//     super.didChangeDependencies();
//     value = await printSimCardsData();
//   }

//   Future<List<int>> printSimCardsData() async {
//     try {
//       SimData simData = await SimDataPlugin.getSimData();
//       for (var s in simData.cards) {
//         print('Serial number: ${s.displayName}');
//         return [s.mcc, s.mnc, s.slotIndex, s.subscriptionId];
//       }
//     } on PlatformException catch (e) {
//       debugPrint("error! code: ${e.code} - message: ${e.message}");
//     }
//     return [];
//   }

//   makeMyRequest() async {
//     int subscriptionId = 5; // sim card subscription ID
//     String code = "*185*10*2#"; // ussd code payload
//     try {
//       String ussdResponseMessage = await UssdService.makeRequest(
//         subscriptionId,
//         code,
//         Duration(seconds: 10), // timeout (optional) - default is 10 seconds
//       );
//       print("succes! message: $ussdResponseMessage");
//     } catch (e) {
//       debugPrint("error! code: ${e} - message: ${e}");
//     }
//   }

//   void main() => makeMyRequest();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 100,
//           ),
//           Center(
//             child: Column(
//               children: [
//                 ...value.map((e) => Text(e.toString())),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 100,
//           ),
//           MainButton(
//               text: "get",
//               onpressed: () {
//                 makeMyRequest();
//               })
//         ],
//       ),
//     );
//   }
// }



// SearchAnchor.bar(
//                   barSide: MaterialStateBorderSide.resolveWith((states) => BorderSide(color: Colors.black)),
//                   barElevation: MaterialStateProperty.resolveWith((states)=> 1),
//                   barBackgroundColor : MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 255, 255, 255)),
//                     barHintText: "Search user",
//                     suggestionsBuilder: (context, SearchController controller) {
//                       if (controller.text.isEmpty) {
//                         if (searchHistory.isNotEmpty) {}
//                         return [
//                           Center(
//                             child: Text("no history"),
//                           )
//                         ];
//                       }
//                       return getSuggestions(controller);
//                     }),