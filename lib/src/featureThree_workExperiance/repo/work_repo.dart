import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/work_model.dart';

class WorkRepo {
  Future<List<WorkModel>>get() async {

  List<WorkModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("WORK EXPERIENCE").get();
  pro.docs.forEach((element) {
  return proList.add(WorkModel.fromJson(element.data()));
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