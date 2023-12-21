import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/per_model.dart';

class PerRepo {
  Future<List<PerModel>>get() async {

  List<PerModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("PERSONAL DETAILS").get();
  pro.docs.forEach((element) {
  return proList.add(PerModel.fromJson(element.data()));
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