import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore firestore=FirebaseFirestore.instance;
User? currentUser=FirebaseAuth.instance.currentUser;


const usersCollection="users";
const productCollection="product";
const cartCollection="cart";