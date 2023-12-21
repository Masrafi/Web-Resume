import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/objective_model.dart';

class ObjectiveRepo {
  Future<List<ObjectiveModel>>get() async {

  List<ObjectiveModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("INTRODUCTION AND OBJECTIVE").get();
  pro.docs.forEach((element) {
  return proList.add(ObjectiveModel.fromJson(element.data()));
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