import 'package:flutter/material.dart';

class SelectAccount extends StatefulWidget {
  const SelectAccount({super.key});

  @override
  State<SelectAccount> createState() => _SelectAccountState();
}



enum Accounts {account_1 , account_2 }


class _SelectAccountState extends State<SelectAccount> {
 Accounts? _character = Accounts.account_1;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jerry Syre", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Text("Available balance : 4000RWF"),
                Text("400034543564553")
              ],
            ),
            Radio(
              value: Accounts.account_1, 
              groupValue: _character, 
              onChanged: (Accounts? value){
                setState(() {
                  _character = value;
                });
              })
          ],
        ),
      ),
    );
  }
}