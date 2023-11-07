import 'package:flutter/material.dart';

class CreateSavingGoalDotted extends StatefulWidget {
  const CreateSavingGoalDotted({super.key});

  @override
  State<CreateSavingGoalDotted> createState() => _CreateSavingGoalDottedState();
}

class _CreateSavingGoalDottedState extends State<CreateSavingGoalDotted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 320,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 233, 233),
          borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create a new saving goal",style: TextStyle(fontSize: 17),),
                SizedBox(width: 15,),
                Icon(Icons.add),
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
            painter: DottedRectPainter(),
                  ),
          ),
     ] ),
    );
  }
}

class DottedRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 87, 87, 87) // Border color
      ..style = PaintingStyle.stroke // Border style
      ..strokeWidth = 2.0; // Border width

    final double dashWidth = 7; // Adjust the width of each dot
    final double dashSpace = 3; // Adjust the space between dots
    double currentX = 0;

    // Draw dotted lines on the top and bottom sides
    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 0),
        Offset(currentX + dashWidth, 0),
        paint,
      );
      canvas.drawLine(
        Offset(currentX, size.height),
        Offset(currentX + dashWidth, size.height),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }

    final double dashHeight = 5; // Adjust the height of each dot
    double currentY = 0;

    // Draw dotted lines on the left and right sides, creating the corners
    while (currentY < size.height) {
      canvas.drawLine(
        Offset(0, currentY),
        Offset(0, currentY + dashHeight),
        paint,
      );
      canvas.drawLine(
        Offset(size.width, currentY),
        Offset(size.width, currentY + dashHeight),
        paint,
      );
      currentY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}




