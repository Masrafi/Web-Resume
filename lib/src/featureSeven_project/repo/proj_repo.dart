import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/proj_model.dart';

class ProjRepo {
  Future<List<ProjModel>>get() async {

  List<ProjModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("PROJECTS").get();
  pro.docs.forEach((element) {
  return proList.add(ProjModel.fromJson(element.data()));
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