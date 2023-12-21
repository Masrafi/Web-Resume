import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/other_model.dart';

class OtherRepo {
  Future<List<OtherModel>>get() async {

  List<OtherModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("OTHERS ABILITY").get();
  pro.docs.forEach((element) {
  return proList.add(OtherModel.fromJson(element.data()));
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