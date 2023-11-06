import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/mainButton.dart';

class LinearProgressWidget extends StatefulWidget {
  const LinearProgressWidget({super.key});

  @override
  State<LinearProgressWidget> createState() => _LinearProgressWidgetState();
}

class _LinearProgressWidgetState extends State<LinearProgressWidget> {
  // Example: Update progress after data is fetched
  Future<void> fetchData() async {
    // Assume some data fetching process
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay
    setState(() {
      _progressValue = 1.0; // Update to 100% after fetching data
    });
  }

  double _progressValue = 0.4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearProgressIndicator(
                semanticsLabel: 'File Download Progress',
                semanticsValue: '$_progressValue% complete',
                minHeight: 8,
                borderRadius: BorderRadius.circular(5),
                backgroundColor: Colors.grey,
                color: Color.fromARGB(255, 22, 101, 167),
                value: _progressValue, // Set the value based on your data
              ),
              SizedBox(height: 20.0),
              Text('Progress: ${(_progressValue * 100).toStringAsFixed(0)}%'),
              SizedBox(
                height: 50,
              ),
              MainButton(text: "fetch", onpressed: fetchData)
            ],
          ),
        ),
      ),
    );
  }
}
