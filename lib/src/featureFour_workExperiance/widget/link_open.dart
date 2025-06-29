import 'package:url_launcher/url_launcher.dart';

class LinkOpen{
  static void onClickAction(String link)async{
    if (await canLaunchUrl(
        Uri.parse(link))) {
      await launchUrl(
          Uri.parse(link));
    } else {
      throw 'Could not launch ${link}';
    }
  }
}