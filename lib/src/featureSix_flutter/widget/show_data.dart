import 'package:flutter/material.dart';

class ShowFrame extends StatelessWidget {
  const ShowFrame({super.key, required this.text});
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
         Icon(Icons.phone_android, size: 10,),
         SizedBox(width: 20,),
         Text(text,),
       ],
     );
  }
}
