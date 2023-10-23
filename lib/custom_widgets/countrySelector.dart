import 'package:flutter/material.dart';

class CountryWidget extends StatefulWidget {
  const CountryWidget({super.key});

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  String _selectedVal = 'assets/images/england.png';


  _CountryWidgetState() {
    _selectedVal = 'assets/images/england.png';
  }

  final _CountryList = [
    
    'assets/images/england.png',
    'assets/images/france.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 60,
      child: DropdownButtonFormField(
        value: _selectedVal,
        items: _CountryList
            .map((e) => DropdownMenuItem(value: e, child: Image.asset(e,height: 20,width: 20,)))
            .toList(),
        onChanged: (val) {
          setState(() {
            _selectedVal = val as String;
          });
        },
        icon: const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Icon(
            size: 27,
            Icons.keyboard_arrow_down,
            color: Color.fromARGB(255, 3, 3, 3),
          ),
        ),
        dropdownColor: const Color.fromARGB(255, 252, 252, 252),
        decoration: InputDecoration(
            // errorText: _selectedValEmpty.isEmpty ? null : _selectedValEmpty,
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255))),
            // label: Text(
            //   'Branch',
            //   style: TextStyle(fontSize: 19),
            // )
            ),
      ),
    );
  }
}
