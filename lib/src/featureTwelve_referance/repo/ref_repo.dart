import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/ref_model.dart';

class RefRepo {
  Future<List<RefModel>>get() async {

  List<RefModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("REFERENCE").get();
  pro.docs.forEach((element) {
  return proList.add(RefModel.fromJson(element.data()));
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