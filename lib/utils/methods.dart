import 'package:flutter/material.dart';

void displaySnackBar(BuildContext context,String? message) {
  final snackBar =  SnackBar(
    backgroundColor: Colors.blue,
    content: Text(message!),
    duration: const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}