import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../model/train_model.dart';

class TrainRepo {
  Future<List<TrainModel>>get() async {

  List<TrainModel> proList=[];
  try {
  final pro= await FirebaseFirestore.instance.collection("PARTICIPATION IN TRAINING").get();
  pro.docs.forEach((element) {
  return proList.add(TrainModel.fromJson(element.data()));
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