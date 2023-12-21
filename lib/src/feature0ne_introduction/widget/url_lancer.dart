import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaun extends StatelessWidget {
  const UrlLaun({super.key, required this.url});
final String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () async{
         if (await canLaunch(url)) {
           await launch(url);
         } else {
           throw 'Could not launch $url';
         }
               
    },
    );
  }
}


Future<Widget?> launch(String url) async {
           const url = 'https://www.google.de/';
           if (await canLaunch(url)) {
             await launch(url);
           } else {
             throw 'Could not launch $url';
           }
         }
         
         
         Widget buildCustomButton( String title, child,) {
             return InkWell(
               onTap: ()async{
                  if (await canLaunch(title)) {
                              await launch(title);
                            } else {
                              throw 'Could not launch $title';
                            }
               },
               child: child,
             );
           }