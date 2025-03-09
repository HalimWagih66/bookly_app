import 'package:flutter/material.dart';

OutlineInputBorder fieldBorderDefault({required Color color}){
  return OutlineInputBorder( gapPadding: 15,borderRadius: BorderRadius.circular(10),borderSide: BorderSide(style: BorderStyle.solid,color: color,width: 0.6));
}