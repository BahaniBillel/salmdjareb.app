import 'package:flutter/material.dart';

class CatCard {
  Icon? icon;
  Text? title;

  CatCard({this.icon, this.title});
}

List<dynamic> CategoriesCards = [
  CatCard(
    icon: const Icon(Icons.home),
    title: const Text("Home"),
  ),
  CatCard(
    icon: const Icon(Icons.electric_car),
    title: const Text("Car"),
  ),
];
