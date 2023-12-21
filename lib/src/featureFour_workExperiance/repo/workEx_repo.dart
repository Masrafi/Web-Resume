import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/workEx_model.dart';

class WorkExRepo {
  Future<List<WorkExModel>>get() async {

  List<WorkExModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("APP IN GOOGLE PLAY & APP STORE").get();
  pro.docs.forEach((element) {
  return proList.add(WorkExModel.fromJson(element.data()));
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