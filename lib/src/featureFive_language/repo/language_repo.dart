import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/language_model.dart';

class LanguageRepo {
  Future<List<LanguageModel>>get() async {

  List<LanguageModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("LANGUAGE").get();
  pro.docs.forEach((element) {
  return proList.add(LanguageModel.fromJson(element.data()));
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