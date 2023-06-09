import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class storageMethod{
  final FirebaseStorage _store= FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //add image on firebase storage
  Future<String> UploadImageToStorage(String childdname, Uint8List file, bool ispost)
  async {
    Reference ref =_store.ref().child(childdname).child(_auth.currentUser!.uid);

    UploadTask uploadTask=ref.putData(file);

    TaskSnapshot snap= await uploadTask;
    String downloadurl=await snap.ref.getDownloadURL();
    return downloadurl;
  }
}