import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  
  const Category({
    required this.id,
    required this.title,
    // não é obrigatório e caso não seja informado assume a cor laranja
    this.color = Colors.orange
  });
}