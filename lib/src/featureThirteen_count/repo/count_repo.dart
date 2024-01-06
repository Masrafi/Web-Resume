import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';


class CountRepo {
      static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future countUser()async {
    final cRef = FirebaseFirestore.instance.collection('VISITOR_COUNT');
        await cRef
            .doc("hUZa9jeRwAYzm0nrEpyh") //Paste the id which was generated automatically
            .set({"count": FieldValue.increment(1)}, SetOptions(merge: true));
  }
  Future deviceInfo()async {
    try{
       var deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
              print(deviceData);
               FirebaseFirestore.instance 
                              .collection('VISITIR_INFO').add({'info': deviceData}); 
    }catch(e){
      print(e.toString());
    }
  }
  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
        return <String, dynamic>{
          'browserName': describeEnum(data.browserName),
          'appCodeName': data.appCodeName,
          'appName': data.appName,
          'appVersion': data.appVersion,
          'deviceMemory': data.deviceMemory,
          'language': data.language,
          'languages': data.languages,
          'platform': data.platform,
          'product': data.product,
          'productSub': data.productSub,
          'userAgent': data.userAgent,
          'vendor': data.vendor,
          'vendorSub': data.vendorSub,
          'hardwareConcurrency': data.hardwareConcurrency,
          'maxTouchPoints': data.maxTouchPoints,
        };
      }
}