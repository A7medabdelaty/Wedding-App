import 'package:flutter/material.dart';
class Constant{

  static  InputDecoration paymentDecoration=  InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,

    ),
    fillColor: Colors.white,
    filled: true,
      hintStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
      )
  );

}