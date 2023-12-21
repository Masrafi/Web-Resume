import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/cer_model.dart';

class CertRepo {
  Future<List<CertModel>>get() async {

  List<CertModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("CERTIFICATION").get();
  pro.docs.forEach((element) {
  return proList.add(CertModel.fromJson(element.data()));
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