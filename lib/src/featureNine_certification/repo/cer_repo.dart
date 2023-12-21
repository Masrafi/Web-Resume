import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/cer_model.dart';

class CerRepo {
  Future<List<CerModel>>get() async {

  List<CerModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("ORGANISATIONAL CERTIFICATE").get();
  pro.docs.forEach((element) {
  return proList.add(CerModel.fromJson(element.data()));
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