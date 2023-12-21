import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/edu_model.dart';

class EduRepo {
  Future<List<EduModel>>get() async {

  List<EduModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("EDUCATION QUALIFICATION").get();
  pro.docs.forEach((element) {
  return proList.add(EduModel.fromJson(element.data()));
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