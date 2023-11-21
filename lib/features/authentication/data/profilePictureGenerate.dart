import 'dart:math';

String chooseRandomPicture() {
  var myStrings = [
    "one.png",
    "two.png",
    "three.png",
    "four.png",
    "five.png",
    "six.png",
    "seven.png",
    "eight.png",
  ];

  final random = Random();
  return myStrings[random.nextInt(myStrings.length)];
}
