import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/images/visa.svg",
                  ),
                  const Spacer(),
                  Text(
                    "02/24",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "victor nsengiyumva",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (isObscure) {
                            setState(() {
                              isObscure = false;
                            });
                          } else {
                            setState(() {
                              isObscure = true;
                            });
                          }
                        },
                        child: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        isObscure
                            ? "**** **** **** ****"
                            : "5797 3945 8349 8758",
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                  child: SvgPicture.asset(
                "assets/images/debitcarddesign.svg",
                fit: BoxFit.fill,
              )))
        ],
      ),
    );
  }
}
