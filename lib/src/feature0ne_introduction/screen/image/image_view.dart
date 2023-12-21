import 'package:flutter/material.dart';
import 'database_manager.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
       future: FireStoreDataBase().getData(),
       builder: (context, snapshot) {
         if (snapshot.hasError) {
           return const Text(
             "Something went wrong",
           );
         }
         if (snapshot.connectionState == ConnectionState.done) {
           return Image.network(
             snapshot.data.toString(),
             height: 200,
           );
         }
         return const Center(child: CircularProgressIndicator());
       },
     );
  }
}
