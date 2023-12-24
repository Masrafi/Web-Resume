import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/flu_model.dart';

class FluRepo {
  Future<List<FluModel>>get() async {

  List<FluModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("TECHNICAL SKILLS").get();
  pro.docs.forEach((element) {
  return proList.add(FluModel.fromJson(element.data()));
  }) ;
  return proList;
  }
  on FirebaseException catch (e)
  {
  if (kDebugMode) {
  print("Failed with error '${e.code}': ${e.message}");
  }
  return proList;
  
  }catch (e) {
  throw Exception(e.toString());
  }
  
  }
}