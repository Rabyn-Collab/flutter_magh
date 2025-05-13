import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloudinary_public/cloudinary_public.dart';


class FirebaseInstances{
  static final fireAuth = FirebaseAuth.instance;
  static final userDb = FirebaseFirestore.instance.collection('users');
  static final bookDb = FirebaseFirestore.instance.collection('books');

}


class CloudinaryInstances{
  static final cloudinary = CloudinaryPublic('dx5eyrlaf', 'sample_pics', cache: false);
}