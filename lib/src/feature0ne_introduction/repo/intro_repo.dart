import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/intro_model.dart';

class IntroRepo {
  Future<List<IntroModel>>get() async {

  List<IntroModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("ABOUT").get();
  pro.docs.forEach((element) {
  return proList.add(IntroModel.fromJson(element.data()));
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